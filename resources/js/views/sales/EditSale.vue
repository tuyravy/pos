<template>
  <div class="app-container">
    <el-card>
      <el-tabs v-model="activeActivity">
        <el-tab-pane label="Fitter" name="first" class="active">
          <el-form
            ref="form"
            :model="form"
            :rules="rules"
            class="demo-form-inline"
            label-width="120px"
          >
            <el-row :gutter="10">
              <el-form-item label="Find Product">
                <el-button type="primary" icon="el-icon-plus" @click="onSubmit()">Add List</el-button>
                <el-col :xs="24" :sm="6" :md="8" :lg="4" :xl="11">
                  <el-autocomplete
                    v-model="form.product_code"
                    popper-class="my-autocomplete"
                    :fetch-suggestions="querySearch"
                    placeholder="Search Product"
                    @select="handleSelect"
                  >
                    <i slot="suffix" class="el-icon-edit el-input__icon" @click="handleIconClick" />
                    <template slot-scope="{ item }">
                      <div class="value">{{ item.value }}</div>
                      <span class="link">{{ item.link }}</span>
                    </template>
                  </el-autocomplete>
                </el-col>
                <el-col :xs="24" :sm="6" :md="8" :lg="6" :xl="11">
                  <el-form-item label="Choose Option" prop="chooseoption">
                    <el-select
                      v-model="form.chooseoption"
                      filterable
                      placeholder="Choose Option"
                      @change="handleChooseOption"
                    >
                      <el-option
                        v-for="(item, index) in optionlist"
                        :key="item.index"
                        :label="item"
                        :value="index+1"
                      />
                    </el-select>
                  </el-form-item>
                </el-col>
              </el-form-item>
            </el-row>
          </el-form>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <pre />
    <el-card>
      <el-tabs v-model="activeActivity">
        <el-tab-pane label="Product List" name="first" class="active">
          <el-table
            :data="list"
            border
            height="280"
            :summary-method="getSummaries"
            show-summary
            style="width: 100%; margin-top: 20px"
          >
            <el-table-column label="Action" width="180" align="center">
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="danger"
                  icon="el-icon-delete"
                  @click="handleRemove(scope.row.id)"
                />
                <el-button
                  v-if="scope.row.edit"
                  type="success"
                  size="small"
                  icon="el-icon-circle-check-outline"
                  @click="confirmEdit(scope.row)"
                >Ok</el-button>
                <el-button
                  v-else
                  type="primary"
                  size="small"
                  icon="el-icon-edit"
                  @click="scope.row.edit=!scope.row.edit"
                />
              </template>
            </el-table-column>
            <el-table-column prop="productname" sortable label="Product Name">
              <template slot-scope="scope">
                <span>{{ scope.row.productcode }}-{{ scope.row.productname }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="displayprice" sortable label="Price ($)" align="center">
              <template slot-scope="scope">
                <template v-if="scope.row.edit">
                  <el-input v-model="scope.row.displayprice" class="edit-input" size="small" />
                  <el-button
                    class="cancel-btn"
                    size="small"
                    icon="el-icon-refresh"
                    type="warning"
                    @click="cancelEdit(scope.row)"
                  />
                </template>
                <span v-else>{{ scope.row.displayprice }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="qty" sortable label="Qty" min-width="70px" align="center">
              <template slot-scope="scope">
                <template v-if="scope.row.edit">
                  <el-input v-model="scope.row.qty" class="edit-input" size="small" />
                  <el-button
                    class="cancel-btn"
                    size="small"
                    icon="el-icon-refresh"
                    type="warning"
                    @click="cancelEdit(scope.row)"
                  />
                </template>
                <span v-else>{{ scope.row.qty }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="discount_percentage" sortable label="Discount (%)">
              <template slot-scope="scope">
                <span>{{ scope.row.discount_percentage }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="product_Tax" label="Vat 10%">
              <template slot-scope="scope">
                <span>{{ scope.row.product_Tax }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="total" sortable label="Total ($)">
              <template slot-scope="scope">
                <span>{{ scope.row.total | numFormat('0,0.00') }}</span>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <pre />
    <el-card>
      <el-tabs v-model="activeActivity">
        <Customerinfo />
      </el-tabs>
    </el-card>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import moment from 'moment';
import Customerinfo from './components/customerinfo';
const AddToListResource = new Resource('addtolist');
const ListTempTableResource = new Resource('listtempProduct');
const RemoveListTempResource = new Resource('removeTempProduct');
const ProductResource = new Resource('ScanProduct');
const PlistbyOptionResource = new Resource('ProductlistbyOption');
const UpdatePricebyOptionResource = new Resource('UpdatePricebyOption');

export default {
  components: { Customerinfo },
  data() {
    return {
      links: [],
      activeActivity: 'first',
      tabIndex: 0,
      list: [],
      optionlist: ['តម្លៃទូទៅ', 'តម្លៃលក់រាយ', 'តម្លៃលក់ដុំ', 'តម្លៃលក់ពិសេស'],
      lists: {},
      loading: false,
      active: 1,
      Inactive: 0,
      editPrice: {},
      listcompany: {},
      Companyfilter: true,
      trnproloading: true,
      trnmodeloading: true,
      form: {
        state: '',
        chooseoption: 1,
      },
      rules: {
        state: [
          {
            required: true,
            message: 'Product search is required',
            trigger: 'blur',
          },
        ],
      },
    };
  },
  mounted() {
    this.links = this.FindProduct();
  },
  created() {
    this.GetListProTemp();
  },
  methods: {
    getSummaries(param) {
      console.log(param);
      const { columns, data } = param;
      const sums = [];
      columns.forEach((column, index) => {
        if (index === 2) {
          sums[index] = 'Grand Total';
          return;
        }
        const values = data.map(item => Number(item[column.property]));
        if (!values.every(value => isNaN(value))) {
          if (index > 2) {
            sums[index] =
              '$ ' +
              values.reduce((prev, curr) => {
                const value = Number(curr);
                if (!isNaN(value)) {
                  return prev + curr;
                } else {
                  return prev;
                }
              }, 0);
          }
        } else {
          if (index > 2) {
            sums[index] = 'N/A';
          }
        }
      });

      return sums;
    },
    next() {
      if (this.active++ > 3) {
        this.active = 1;
      }
    },
    backnext() {
      if (this.active-- < 3) {
        this.Inactive = this.active;
        console.log(this.active);
      }
    },
    querySearch(queryString, cb) {
      var links = this.links;
      var results = queryString
        ? links.filter(this.createFilter(queryString))
        : links;
      // call callback function to return suggestion objects
      cb(results);
    },
    async FindProduct() {
      const { data } = await ProductResource.list();
      this.links = data;
    },
    async GetListProTemp() {
      this.loading = true;
      const { data } = await ListTempTableResource.list();
      const tableData = data.items;
      this.list = tableData.map(v => {
        this.$set(v, 'edit', false);
        v.qtyoriginal = v.qty;
        v.unit_priceorig = v.displayprice; // https://vuejs.org/v2/guide/reactivity.html//  will be used when user click the cancel botton
        return v;
      });
      this.loading = false;
    },
    handleRemove(row) {
      this.$confirm(`Are you sure you want to delete?`, '', { type: 'warning' })
        .then(() => {
          RemoveListTempResource.destroy(row);
          this.$message({
            message: 'Items has been delete successfully',
            type: 'success',
            duration: 5 * 1000,
          });
          this.GetListProTemp();
        })
        .catch(error => {
          console.log(error);
        });
    },
    cancelEdit(row) {
      row.qty = row.qtyoriginal;
      row.displayprice = row.unit_priceorig;
      row.edit = false;
      this.$message({
        message: 'The title has been restored to the original value',
        type: 'warning',
      });
    },
    confirmEdit(row) {
      row.edit = false;
      row.qtyoriginal = row.qty;
      row.unit_priceorig = row.displayprice;
      this.editPrice = {
        productcode: row.productcode,
        qty: row.qty,
        displayprice: row.displayprice,
        chooseoption: this.form.chooseoption,
      };
      UpdatePricebyOptionResource.store(this.editPrice)
        .then(response => {
          this.$message({
            message: 'The information has been edited',
            type: 'success',
          });
          this.GetListProTemp();
        })
        .catch(error => {
          console.log(error);
        });
    },
    handleChooseOption() {
      PlistbyOptionResource.update(this.form.chooseoption)
        .then(response => {
          this.$message({
            message: 'Product information has been change option sale',
            type: 'success',
            duration: 5 * 1000,
          });
          this.GetListProTemp();
        })
        .catch(error => {
          console.log(error);
        });
    },
    createFilter(queryString) {
      return link => {
        return (
          link.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0
        );
      };
    },
    handleSelect(item) {
      console.log(item);
    },
    handleIconClick(ev) {
      console.log(ev);
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    onSubmit() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          AddToListResource.store(this.form)
            .then(response => {
              this.$message({
                message: 'Sale has been created successfully.',
                type: 'success',
                duration: 5 * 1000,
              });
              this.GetListProTemp();
            })
            .catch(error => {
              console.log(error);
            });
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(form) {
      this.$refs[form].resetFields();
    },
  },
};
</script>
<style scoped>
.line {
  text-align: center;
}
.el-table th {
  background: #1e9fda;
  color: white;
  pointer-events: none;
}
.edit-input {
  padding-right: 100px;
}
.cancel-btn {
  position: absolute;
  right: 15px;
  top: 10px;
}
.dialog-footer {
  text-align: left;
  padding-top: 0;
  margin-left: 150px;
}
.app-container {
  flex: 1;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;
  .block {
    float: left;
    min-width: 250px;
  }
  .clear-left {
    clear: left;
  }
}
.edit-input {
  padding-right: 50px;
}
.cancel-btn {
  position: absolute;
  right: 15px;
  top: 10px;
}
</style>
