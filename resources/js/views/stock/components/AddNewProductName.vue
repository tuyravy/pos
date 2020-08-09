<template>
  <div class="app-container">
    <el-tabs>
      <el-form ref="form" :model="form" :rules="rules" label-width="160px">
        <el-form-item :label="$t('Branch')" prop="BrCode">
          <el-col :span="24">
            <el-select v-model="form.BrCode" filterable :placeholder="$t('Branch')">
              <el-option value="" label="None">None</el-option>
              <el-option
                v-for="item in ListBranch"
                :key="item.BrCode"
                :label="item.ShortCode"
                :value="item.BrCode"
              />
            </el-select>
          </el-col>
        </el-form-item>
        <el-form-item :label="$t('categoryname')" prop="subcategory_id">
          <el-col :span="12">
            <el-select v-model="form.subcategory_id" filterable :placeholder="$t('categoryname')">
              <el-option value="" label="None">None</el-option>
              <el-option
                v-for="item in ListSubCategory"
                :key="item.SubCategoryId"
                :label="item.SubCategoryName"
                :value="item.SubCategoryId"
              />
            </el-select>
          </el-col>
          <el-col class="line" :span="2" style="margin-left:-30px;">
            <el-button type="primary" icon="el-icon-plus" @click="CategoryAdd = true" />
          </el-col>
        </el-form-item>
        <el-form-item :label="$t('WarehouseName')" prop="warehouse_id">
          <el-col :span="24">
            <el-select v-model="form.warehouse_id" filterable :placeholder="$t('WarehouseName')">
              <el-option value="" label="None">None</el-option>
              <el-option
                v-for="item in ListOfWarehouse"
                :key="item.warehouse_id"
                :label="item.warehouse_name"
                :value="item.warehouse_id"
              />
            </el-select>
          </el-col>
        </el-form-item>
        <el-form-item :label="$t('productcode')" prop="productcode">
          <el-col :span="24">
            <el-input v-model="form.product_code" :placeholder="$t('productcode')" />
          </el-col>
        </el-form-item>
        <el-form-item :label="$t('product_name_eng')" prop="product_name_eng">
          <el-col :span="24">
            <el-input v-model="form.product_name_eng" :placeholder="$t('product_name_eng')" />
          </el-col>
        </el-form-item>
        <el-form-item :label="$t('product_name_kh')" prop="product_name_kh">
          <el-col :span="24">
            <el-input
              v-model="form.product_name_kh"
              type="textarea"
              :placeholder="$t('product_name_kh')"
            />
          </el-col>
        </el-form-item>
        <el-form-item :label="$t('Noted')">
          <el-col :span="24">
            <el-input v-model="form.product_details" type="textarea" :placeholder="$t('Noted')" />
          </el-col>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="AddNewProductName()">{{ $t('Button.Create') }}</el-button>
          <el-button @click="resetForm('form')">{{ $t('Button.Reset') }}</el-button>
        </el-form-item>
      </el-form>
    </el-tabs>
    <el-dialog :title="$t('subcategoryname')" :visible.sync="CategoryAdd" append-to-body>
      <SubCategory />
    </el-dialog>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import moment from 'moment';
import SubCategory from './AddNewSubCategory';
const AddProductResource = new Resource('sys_product');
const GetbranchResource = new Resource('GetBranch');
const GetSubCategoryResource = new Resource('sys_SubCategory');
const GetWarehouseResource = new Resource('GetWarehouse');
export default {
  components: { SubCategory },
  data() {
    return {
      Total: 0,
      links: [],
      CategoryAdd: false,
      outerVisible: false,
      innerVisible: false,
      ListBranch: [],
      ListSubCategory: [],
      ListOfWarehouse: [],
      form: {
        BrCode: '',
        subcategory_id: '',
        product_code: '',
        product_name_eng: '',
        product_name_kh: '',
      },
      rules: {
        BrCode: [
          {
            required: true,
            message: 'Branch is required',
            trigger: 'change',
          },
        ],
        subcategory_id: [
          {
            required: true,
            message: 'Category Name is required',
            trigger: 'change',
          },
        ],
        warehouse_id: [
          {
            required: true,
            message: 'Warehouse Name is required',
            trigger: 'change',
          },
        ],
        product_code: [
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
    this.getBranch();
    this.getSubCategory();
    this.getWarehouse();
  },
  methods: {
    async getBranch() {
      this.loading = true;
      const { data } = await GetbranchResource.list();
      this.ListBranch = data;
      this.loading = false;
    },
    async getWarehouse() {
      this.loading = true;
      const { data } = await GetWarehouseResource.list();
      this.ListOfWarehouse = data;
      this.loading = false;
    },
    async getSubCategory() {
      this.loading = true;
      const { data } = await GetSubCategoryResource.list();
      this.ListSubCategory = data;
      this.loading = false;
    },
    AddNewProductName() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          AddProductResource.store(this.form)
            .then(response => {
              this.$message({
                message: 'Product Add New Item name has been created successfully.',
                type: 'success',
                duration: 5 * 1000,
              });
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
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
  },
};
</script>
