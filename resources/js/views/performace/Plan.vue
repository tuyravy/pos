<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="160px">
      <el-form-item label="Plan Name" prop="PlanName">
        <el-col :span="11">
          <el-input v-model="form.PlanName" placeholder="Please input your plan name" />
        </el-col>
      </el-form-item>
      <el-form-item label="Plan Date" prop="PlanDate">
        <el-col :span="11">
          <el-date-picker
            v-model="form.PlanDate"
            type="date"
            placeholder="Plan date"
            style="width: 100%;"
          />
        </el-col>
      </el-form-item>
      <el-form-item label="Company" prop="CompanyId">
        <el-select
          v-model="form.CompanyId"
          v-loading="Companyfilter"
          placeholder="Please select your company"
          @change="handleFilter"
        >
          <el-option
            v-for="item in list"
            :key="item.Company_id"
            :label="item.company_name_en"
            :value="item.Company_id"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="Plan Mode" prop="PlanMode">
        <el-select
          v-model="form.PlanMode"
          v-loading="Loading"
          placeholder="Please select your plan mode"
        >
          <el-option
            v-for="item in PlanModelist"
            :key="item.look_id"
            :label="item.short_name"
            :value="item.look_id"
          />
        </el-select>
      </el-form-item>
      <el-form-item
        v-if="form.CompanyId==7"
        :label="$t('plan.servicepackage')"
        prop="servicepackage"
      >
        <el-radio-group v-model="form.servicepackage">
          <el-radio label="Client" @change="handleradio" />
          <el-radio label="Value" @change="handleradio" />
        </el-radio-group>
      </el-form-item>
      <el-form-item
        v-if="form.CompanyId==5 || form.CompanyId==6"
        :label="$t('plan.servicepackage')"
        prop="servicepackage"
      >
        <el-radio-group v-model="form.servicepackage">
          <el-radio label="USD" @change="handleradio" />
          <el-radio label="LIT" @change="handleradio" />
        </el-radio-group>
      </el-form-item>
      <template v-for="({type, name, label }) in fields">
        <el-form-item :key="label" :label="label" :prop="fields[name]">
          <el-col :span="8">
            <el-input
              v-model="fields[name]"
              :name="name"
              :type="type"
              :for="name"
              required
              @input="updateField(name, $event)"
            />
          </el-col>
        </el-form-item>
      </template>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">Create</el-button>
        <el-button @click="onCancel">Cancel</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import Vue from 'vue';
import Resource from '@/api/resource';
const CompanyResource = new Resource('company');
const fieldsResource = new Resource('dynamicform');
const PlanResource = new Resource('plan');
const ModeResource = new Resource('modes');
const ServicetypeResource = new Resource('formbyservicetype');
export default {
  data() {
    return {
      fields: [],
      list: {},
      Loading: true,
      PlanModelist: {},
      rules: {
        PlanName: [
          {
            required: true,
            message: 'Please input Activity name',
            trigger: 'blur',
          },
        ],
        servicepackage: [
          {
            required: true,
            message: 'Please select currency ',
            trigger: 'change',
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
        CompanyId: [
          {
            required: true,
            message: 'Please select company ',
            trigger: 'change',
          },
        ],
        PlanMode: [
          {
            required: true,
            message: 'Please select plan mode ',
            trigger: 'change',
          },
        ],
      },
      Companyfilter: true,
      form: { PlanName: '', PlanDate: '', CompanyId: '' },
    };
  },
  created() {
    this.getList();
    this.getMode();
    this.getFields();
    this.fields.map(f => {
      Vue.set(this.form, f.name, null);
    });
  },
  methods: {
    async getList() {
      const { data } = await CompanyResource.list({});
      this.list = data;
    },
    async getMode() {
      this.Loading = true;
      this.form.TrnModeType = 'PLAMode';
      const { data } = await ModeResource.list(this.form);
      this.PlanModelist = data;
      this.Loading = false;
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
    async getFieldsbyservice() {
      this.Companyfilter = true;
      const { data } = await ServicetypeResource.list(this.form);
      this.fields = data;
      this.Companyfilter = false;
    },
    handleFilter() {
      this.Companyfilter = true;
      this.form.page = 1;
      this.getFields();
      this.getMode();
      this.Companyfilter = false;
    },
    handleradio() {
      this.getFieldsbyservice();
    },
    updateField(field, value) {
      if (value.length === 0) {
        this.form[field] = 0;
      }
      this.form[field] = value;
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
