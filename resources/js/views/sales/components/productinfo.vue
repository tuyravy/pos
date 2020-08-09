<template>
  <div class="app-container">
    <el-table
      :loading="loading"
      :data="list"
      border
      height="400"
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
          >Edit</el-button>
        </template>
      </el-table-column>
      <el-table-column prop="id" label="ID" width="50" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="productcode" label="Product Code">
        <template slot-scope="scope">
          <span>{{ scope.row.productcode }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="productname" label="Product Name">
        <template slot-scope="scope">
          <span>{{ scope.row.productname }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="unit_price" label="Price ($)" align="center">
        <template slot-scope="scope">
          <template v-if="scope.row.edit">
            <el-input v-model="scope.row.unit_price" class="edit-input" size="small" />
            <el-button
              class="cancel-btn"
              size="small"
              icon="el-icon-refresh"
              type="warning"
              @click="cancelEdit(scope.row)"
            />
          </template>
          <span v-else>{{ scope.row.unit_price }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="qty" label="Qty" min-width="70px" align="center">
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
      <el-table-column prop="discount_percentage" label="Discount (%)">
        <template slot-scope="scope">
          <span>{{ scope.row.discount_percentage }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="product_Tax" label="Vat 10%">
        <template slot-scope="scope">
          <span>{{ scope.row.product_Tax }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="product_Tax" label="Total ($)">
        <template slot-scope="scope">
          <span>{{ scope.row.product_Tax }}</span>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directiv

const AddToListResource = new Resource('addtolist');

const ListTempTableResource = new Resource('listtempProduct');
const RemoveListTempResource = new Resource('removeTempProduct');

export default {
  directives: { waves, permission },
  data() {
    return {
      itemlist: [],
      active: 2,
      list: [],
      form: {
        state: '',
      },
      loading: false,
      tableData: [],
      rules: {
        state: [
          {
            required: true,
            message: 'Product search is required',
            trigger: 'blur',
          },
        ],
      },
      query: {
        page: 1,
        limit: 15,
        brcode: '',
      },
    };
  },
  created() {
    this.GetListProTemp();
  },
  methods: {
    getSummaries(param) {
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
    onSubmit() {
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
    },
    async GetListProTemp() {
      this.loading = true;
      const { data } = await ListTempTableResource.list();
      const tableData = data.items;
      this.list = tableData.map(v => {
        this.$set(v, 'edit', false);
        v.qtyoriginal = v.qty;
        v.unit_priceorig = v.unit_price; // https://vuejs.org/v2/guide/reactivity.html//  will be used when user click the cancel botton
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
      row.unit_price = row.unit_priceorig;
      row.edit = false;
      this.$message({
        message: 'The title has been restored to the original value',
        type: 'warning',
      });
    },
    confirmEdit(row) {
      row.edit = false;
      row.qtyoriginal = row.qty;
      row.unit_priceorig = row.unit_price;
      this.$message({
        message: 'The title has been edited',
        type: 'success',
      });
    },
  },
};
</script>

<style lang="scss" scoped>
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
