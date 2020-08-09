<template>
  <div class="app-container">
    <el-tabs>
      <el-form ref="form" :model="form" :rules="rules" label-width="160px">
        <el-form-item :label="$t('CategoryName')" prop="CategoryId">
          <el-col :span="24">
            <el-select v-model="form.CategoryId" filterable :placeholder="$t('CategoryName')">
              <el-option value="1" label="None">None</el-option>
              <el-option
                v-for="item in listofcategory"
                :key="item.CategoryId"
                :label="item.CategoryName"
                :value="item.CategoryId"
              />
            </el-select>
          </el-col>
        </el-form-item>
        <el-form-item :label="$t('setSubCategoryName')" prop="setSubCategoryName">
          <el-col :span="24">
            <el-input v-model="form.setSubCategoryName" :placeholder="$t('setSubCategoryName')" />
          </el-col>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="AddNewProductName()">{{ $t('Button.Create') }}</el-button>
          <el-button @click="resetForm('form')">{{ $t('Button.Reset') }}</el-button>
        </el-form-item>
      </el-form>
    </el-tabs>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import moment from 'moment';
const AddNewCategory = new Resource('AddSubCategory');
const GetCategoryResource = new Resource('sys_Category');

export default {
  data() {
    return {
      Total: 0,
      links: [],
      CategoryAdd: false,
      listofcategory: [],
      form: {
        CategoryId: '',
        setSubCategoryName: '',
      },
      rules: {
        setSubCategoryName: [
          {
            required: true,
            message: 'SubCategory Name is required',
            trigger: 'change',
          },
        ],
        CategoryId: [
          {
            required: true,
            message: 'Category Name is required',
            trigger: 'blur',
          },
        ],
      },
    };
  },
  mounted() {},
  created() {
    this.getCategory();
  },
  methods: {
    async getCategory() {
      this.loading = true;
      const { data } = await GetCategoryResource.list();
      this.listofcategory = data;
      this.loading = false;
    },
    AddNewProductName() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          AddNewCategory.store(this.form)
            .then(response => {
              this.$message({
                message: 'SubCategory has been created successfully.',
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

