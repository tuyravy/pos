<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="160px">
      <el-form-item label="Plan Name" prop="PlanName">
        <el-col :span="11">
          <el-input v-model="form.PlanName" :value="form.planName" placeholder="Please input your plan name" />
        </el-col>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">Save</el-button>
        <el-button @click="onCancel">Cancel</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import Resource from '@/api/resource';
const CompanyResource = new Resource('company');
const fieldsResource = new Resource('dynamicform');
const PlanResource = new Resource('updatePlan');

export default {
  data() {
    return {
      fields: [],
      list: {},
      rules: {
        PlanName: [
          {
            required: true,
            message: 'Please input Activity name',
            trigger: 'blur',
          },
        ],
        PlanDate: [
          {
            type: 'date',
            required: true,
            message: 'Please pick a date',
            trigger: 'change',
          },
        ],
        CompanyCode: [
          {
            required: true,
            message: 'Please select company ',
            trigger: 'change',
          },
        ],
      },
      Companyfilter: true,
      form: { PlanName: '', PlanDate: '', CompanyCode: '' },
    };
  },
  watch: {
    $route: 'getListPlan',
  },
  created() {
    this.getList();
    this.getFields();
    const id = this.$route.params && this.$route.params.id;
    this.getListPlan(id);
  },
  methods: {
    async getListPlan(id) {
      const { data } = await PlanResource.get(id);
      this.form.PlanName = data.PlanName;
      this.form = Object.assign({}, data);
      console.log(this.form);
    },
    async getList() {
      const { data } = await CompanyResource.list({});
      this.list = data;
    },
    async getFields() {
      this.Companyfilter = true;
      const { limit, page } = this.form;
      const { data } = await fieldsResource.list(this.form);
      this.fields = data;
      this.fields.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.Companyfilter = false;
    },
    handleFilter() {
      this.Companyfilter = true;
      this.form.page = 1;
      this.getFields();
      this.Companyfilter = false;
    },
    onSubmit() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          PlanResource.store(this.form)
            .then(response => {
              this.$message({
                message: 'plan has been created successfully.',
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
    onCancel() {
      this.$message({
        message: 'cancel!',
        type: 'warning',
      });
    },
  },
};
</script>

<style scoped>
.line {
  text-align: center;
}
</style>
