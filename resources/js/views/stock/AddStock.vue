<template>
  <div class="app-container">
    <el-card>
      <el-tabs v-model="activeActivity">
        <el-tab-pane :label="$t('filter')" name="first" class="active">
          <el-form
            ref="form"
            :model="form"
            :rules="rules"
            class="demo-form-inline"
            label-width="150"
          >
            <el-row :gutter="8">
              <el-button
                type="primary"
                icon="el-icon-plus"
                style="margin-left:-50px"
                @click="onSubmit()"
              >{{ $t('Button.AddToList') }}</el-button>
              <el-button
                type="success"
                icon="el-icon-plus"
                style="margin-left:10px"
                @click="outerVisible = true"
              >{{ $t('Button.AddItemName') }}</el-button>
              <el-col :xs="24" :sm="6" :md="16" :lg="14" :xl="11">
                <el-form-item :label="$t('FindCategory')" style="margin-left:15px">
                  <el-select
                    v-model="form.CategoryId"
                    filterable
                    :placeholder="$t('FindCategory')"
                    @change="GetProductList"
                  >
                    <el-option
                      v-for="item in CategoryList"
                      :key="item.SubCategoryId"
                      :label="item.SubCategoryName"
                      :value="item.SubCategoryId"
                    />
                  </el-select>
                  <el-select
                    v-model="form.product_code"
                    filterable
                    :placeholder="$t('FindProduct')"
                    @change="AddProduct"
                  >
                    <el-option
                      v-for="item in ListProduct"
                      :key="item.product_code"
                      :label="item.product_code+' => '+item.product_name_kh"
                      :value="item.product_code"
                    />
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <pre />
    <el-card>
      <div slot="header" class="clearfix">
        <el-button
          style="float: left; padding: 3px 5px;color: black;font-weight: bold;"
          type="text"
        >{{ $t('ProductList') }}</el-button>
      </div>

      <el-table :data="StockList" :summary-method="getSummaries" show-summary>
        <el-table-column :label="$t('table.Actions')" prop="Action" width="120" align="center">
          <template slot-scope="scope">
            <el-button
              type="danger"
              icon="el-icon-delete"
              circle
              @click="handleRemove(scope.row.id)"
            />
            <el-button
              v-if="scope.row.edit"
              type="success"
              icon="el-icon-check"
              style="margin-left:-2px;"
              circle
              @click="confirmEdit(scope.row)"
            />
            <el-button
              v-else
              type="primary"
              icon="el-icon-edit"
              style="margin-left:-2px;"
              circle
              @click="scope.row.edit=!scope.row.edit"
            />
          </template>
        </el-table-column>
        <el-table-column sortable :label="$t('table.ProductName')" prop="productname">
          <template slot-scope="scope">
            <span>{{ scope.row.product_code }}-{{ scope.row.product_name_kh }}</span>
          </template>
        </el-table-column>
        <el-table-column sortable :label="$t('table.UnitPrice')" align="center" prop="cost">
          <template slot-scope="scope">
            <template v-if="scope.row.edit">
              <el-input v-model="scope.row.cost" class="edit-input" size="small" />
              <el-button
                class="cancel-btn"
                size="small"
                icon="el-icon-refresh"
                type="warning"
                style="margin-top:-3px"
                @click="cancelEdit(scope.row)"
              />
            </template>
            <span v-else>{{ scope.row.cost }}</span>
          </template>
        </el-table-column>
        <el-table-column
          sortable
          :label="$t('table.DefultPrice')"
          align="center"
          prop="defult_price"
        >
          <template slot-scope="scope">
            <template v-if="scope.row.edit">
              <el-input v-model="scope.row.defult_price" class="edit-input" size="small" />
              <el-button
                class="cancel-btn"
                size="small"
                icon="el-icon-refresh"
                type="warning"
                style="margin-top:-3px"
                @click="cancelEdit(scope.row)"
              />
            </template>
            <span v-else>{{ scope.row.defult_price }}</span>
          </template>
        </el-table-column>
        <el-table-column
          sortable
          :label="$t('table.RetailPrice')"
          align="center"
          prop="retail_price"
        >
          <template slot-scope="scope">
            <template v-if="scope.row.edit">
              <el-input v-model="scope.row.retail_price" class="edit-input" size="small" />
              <el-button
                class="cancel-btn"
                size="small"
                icon="el-icon-refresh"
                type="warning"
                style="margin-top:-3px"
                @click="cancelEdit(scope.row)"
              />
            </template>
            <span v-else>{{ scope.row.retail_price }}</span>
          </template>
        </el-table-column>
        <el-table-column
          sortable
          :label="$t('table.WholesalePrice')"
          align="center"
          prop="wholesale_price"
        >
          <template slot-scope="scope">
            <template v-if="scope.row.edit">
              <el-input v-model="scope.row.wholesale_price" class="edit-input" size="small" />
              <el-button
                class="cancel-btn"
                size="small"
                icon="el-icon-refresh"
                type="warning"
                style="margin-top:-3px"
                @click="cancelEdit(scope.row)"
              />
            </template>
            <span v-else>{{ scope.row.wholesale_price }}</span>
          </template>
        </el-table-column>
        <el-table-column sortable :label="$t('table.Qty')" align="center" prop="qty">
          <template slot-scope="scope">
            <template v-if="scope.row.edit">
              <el-input v-model="scope.row.qty" class="edit-input" size="small" />
              <el-button
                class="cancel-btn"
                size="mini"
                icon="el-icon-refresh"
                type="warning"
                style="margin-top:-4px"
                @click="cancelEdit(scope.row)"
              />
            </template>
            <span v-else>{{ scope.row.qty }}</span>
          </template>
        </el-table-column>

        <el-table-column prop="total" sortable :label="$t('table.Total')">
          <template slot-scope="scope">
            <span>{{ scope.row.total | numFormat('0,0.00') }}</span>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <pre />

    <el-row :gutter="24">
      <el-col
        :xs="{span: 24}"
        :sm="{span: 24}"
        :md="{span: 24}"
        :lg="{span: 12}"
        :xl="{span: 12}"
        style="padding-right:8px;margin-bottom:30px;"
      >
        <el-card>
          <el-tabs v-model="activeActivity">
            <el-tab-pane :label="$t('productpackage')" name="first" class="active">
              <el-form ref="form" :model="form" :rules="rules" label-width="160px">
                <el-form-item :label="$t('Purchasedate')" prop="Purchasedate">
                  <el-col :span="24">
                    <el-date-picker
                      v-model="form.SaleDate"
                      type="date"
                      :placeholder="$t('Purchasedate')"
                      style="width: 100%;"
                      :disabled="true"
                    />
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('Supplier')" prop="Supplier">
                  <el-col :span="24">
                    <el-select v-model="form.SystemId" filterable :placeholder="$t('Supplier')">
                      <el-option value="1" label="None">None</el-option>
                      <el-option
                        v-for="item in SupplierList"
                        :key="item.id"
                        :label="item.supplier_name"
                        :value="item.id"
                      />
                    </el-select>
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('Reff_no')" prop="reff_no">
                  <el-col :span="24">
                    <el-input v-model="form.reff_no" :placeholder="$t('Reff_no')" />
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('Amount')" prop="reff_no">
                  <el-col :span="24">
                    <el-input v-model="form.reff_no" :placeholder="$t('Amount')" />
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('Noted')">
                  <el-col :span="24">
                    <el-input
                      v-model="form.DeliveryAddress"
                      type="textarea"
                      :placeholder="$t('Noted')"
                    />
                  </el-col>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="onSubmit()">{{ $t('Button.Create') }}</el-button>
                  <el-button @click="resetForm('form')">{{ $t('Button.Reset') }}</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
    <el-dialog :title="$t('dialog.createproduct')" :visible.sync="outerVisible">
      <el-dialog width="30%" title="Inner Dialog" :visible.sync="innerVisible" append-to-body />
      <AddNewProduct />
    </el-dialog>
  </div>
</template>

<script>
import Resource from '@/api/resource';
import AddNewProduct from './components/AddNewProductName';
const AddToListResource = new Resource('AddStockToList');
const SubCategoryResource = new Resource('ScanCategory');
const SupplierListResource = new Resource('SupplierList');
const SubCategoryToProductResource = new Resource('SubCategoryToProduct');
const StockTempListResource = new Resource('StockTempList');
export default {
  components: { AddNewProduct },
  data() {
    return {
      Total: 0,
      activeActivity: 'first',
      CategoryList: {},
      SupplierList: {},
      innerVisible: false,
      outerVisible: false,
      CategoryAdd: false,
      tabIndex: 0,
      list: [],
      ListBranch: [],
      StockList: [],
      lists: {},
      loading: false,
      active: 1,
      Inactive: 0,
      editPrice: {},
      listcompany: {},
      ListProduct: {},
      Companyfilter: true,
      Loading: false,
      form: {
        CategoryId: '',
      },
      rules: {
        state: [
          {
            required: true,
            message: 'Product search is required',
            trigger: 'blur',
          },
        ],
        TrnName: [
          {
            required: true,
            message: 'Transaction Name is required',
            trigger: 'blur',
          },
        ],
        PrCode: [
          {
            required: true,
            message: 'Please select Product',
            trigger: 'change',
          },
        ],
        TrnDate: [
          {
            required: true,
            message: 'Transaction date is required',
            trigger: 'change',
          },
        ],
        TrnMode: [
          {
            required: true,
            message: 'Please select transaction mode ',
            trigger: 'change',
          },
        ],
        ccy: [
          {
            required: true,
            message: 'Please select currency ',
            trigger: 'change',
          },
        ],
        CompanyId: [
          {
            required: true,
            message: 'Please select companyCode ',
            trigger: 'change',
          },
        ],
        amount: [
          {
            required: true,
            message: 'Transaction amount is required',
            trigger: 'blur',
          },
        ],
        Branch: [
          {
            required: true,
            message: 'Branch is required',
            trigger: 'change',
          },
        ],
        categoryname: [
          {
            required: true,
            message: 'Category Name is required',
            trigger: 'change',
          },
        ],
        productcode: [
          {
            required: true,
            message: 'Product Code Name is required',
            trigger: 'blur',
          },
        ],
        product_name_eng: [
          {
            required: true,
            message: 'Product Name Eng is required',
            trigger: 'blur',
          },
        ],
        product_name_kh: [
          {
            required: true,
            message: 'Product Name kh is required',
            trigger: 'blur',
          },
        ],
      },
    };
  },
  mounted() {
    this.GetStockTempList();
  },
  created() {
    this.ListOffCategory();
    this.ListSupplier();
    this.GetStockTempList();
  },
  methods: {
    getSummaries(param) {
      const { columns, data } = param;
      const sums = [];
      columns.forEach((column, index) => {
        if (index === 1) {
          sums[index] = this.$t('table.GrandTotal');
          return;
        }
        const values = data.map((item) => Number(item[column.property]));
        if (!values.every((value) => isNaN(value))) {
          if (index === 2 || index === 5) {
            sums[index] =
              '$  ' +
              values.reduce((prev, curr) => {
                const value = Number(curr);
                if (!isNaN(value)) {
                  this.Total = prev + curr;
                  return prev + curr;
                } else {
                  return prev;
                }
              }, 0);
          } else {
            sums[index] = values.reduce((prev, curr) => {
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
    async ListOffCategory() {
      const { data } = await SubCategoryResource.list();
      this.CategoryList = data;
    },
    async ListSupplier() {
      const { data } = await SupplierListResource.list();
      this.SupplierList = data;
    },
    async GetStockTempList() {
      const { data } = await StockTempListResource.list();
      const tableData = data.items;
      this.StockList = tableData.map((v) => {
        this.$set(v, 'edit', false);
        v.costoriginal = v.cost;
        v.defult_priceorig = v.defult_price;
        return v;
      });
    },
    async GetProductList() {
      const { data } = await SubCategoryToProductResource.list(this.form);
      this.ListProduct = data;
    },
    /* Add Product to Histroy table */
    async AddProduct() {
      AddToListResource.store(this.form)
        .then((response) => {
          this.$message({
            message: 'Sale has been created successfully.',
            type: 'success',
            duration: 5 * 1000,
          });
          this.GetStockTempList();
        })
        .catch((error) => {
          console.log(error);
        });
    },
    handleIconClick(ev) {
      console.log(ev);
      this.form.product_code = '';
    },
    onSubmit() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          AddToListResource.store(this.form)
            .then((response) => {
              this.$message({
                message: 'Sale has been created successfully.',
                type: 'success',
                duration: 5 * 1000,
              });
              this.GetListProTemp();
            })
            .catch((error) => {
              console.log(error);
            });
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    AddNewProductName() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          AddToListResource.store(this.form)
            .then((response) => {
              this.$message({
                message: 'Product has been created successfully.',
                type: 'success',
                duration: 5 * 1000,
              });
              this.GetListProTemp();
            })
            .catch((error) => {
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
    cancelEdit(row) {
      row.cost = row.costoriginal;
      row.defult_price = row.defult_priceorig;
      row.edit = false;
      this.$message({
        message: 'The title has been restored to the original value',
        type: 'warning',
      });
    },
    confirmEdit(row) {
      row.edit = false;
      row.costoriginal = row.cost;
      row.defult_priceorig = row.defult_price;
      this.editPrice = {
        productcode: row.productcode,
        qty: row.qty,
        defult_priceorig: row.defult_price,
      };
    },
  },
};
</script>
<style>
.el-table th {
  background-color: rgba(192, 229, 253, 0.5);
  color: black;
  padding: 3px !important;
}
.el-table td {
  padding: 6px !important;
}
#tab-first {
  color: black;
  font-weight: bold;
}
div.el-tabs__active-bar.is-top {
  background-color: #e6ebf5;
}
</style>
<style scoped>
.line {
  text-align: center;
}
#el-autocomplete {
  border: 2px red solid;
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
