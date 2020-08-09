<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="150px">
      
      <el-form-item :label="$t('sales.company')" prop="Company_id">
        <el-select
          v-model="form.CompanyName"
          v-loading="Companyfilter"
          class="filter-item"
          placeholder="Please select your company"
          @change="handleFilter($event)"
        >
          <el-option
            v-for="item in listcompany"
            :key="item.Company_id"
            :label="item.company_name_en"
            :value="item.Company_id"
          >{{ item.company_name_en }}</el-option>
        </el-select>
      </el-form-item>
      <el-form-item :label="$t('sales.trnname')" prop="TrnName">
        <el-col :span="11">
          <el-input v-model="form.TrnName" placeholder="Please input your transaction name" />
        </el-col>
      </el-form-item>
      <el-form-item :label="$t('sales.product')" prop="PrName">
        <el-select
          v-model="form.PrName"
          v-loading="trnproloading"
          placeholder="Please select your product"
        >
          <el-option
            v-for="item in listProduct"
            :key="item.prcode"
            :label="item.FullDesc"
            :value="item.prcode"
          />
        </el-select>
      </el-form-item>
      <el-form-item :label="$t('sales.trndate')" prop="TrnDate">
        <el-col :span="11">
          <el-date-picker
            v-model="form.TrnDate"
            type="date"
            placeholder="Transaction date"
            style="width: 100%;"
          />
        </el-col>
      </el-form-item>
      <el-form-item :label="$t('sales.trnmode')" prop="TrnMode">
        <el-select
          v-model="form.TrnModeName"
          v-loading="trnmodeloading"
          placeholder="Please select your mode"
        >
          <el-option
            v-for="item in listMode"
            :key="item.look_id"
            :label="item.short_name"
            :value="item.look_id"
          />
        </el-select>
      </el-form-item>
      <el-form-item :label="$t('sales.ccy')" prop="ccy">
        <el-radio-group v-model="form.ccy">
          <el-radio label="KHR" />
          <el-radio label="USD" />
        </el-radio-group>
      </el-form-item>
      <el-form-item :label="$t('sales.trnamt')" prop="TrnAmt">
        <el-col :span="11">
          <el-input
            v-model="form.TrnAmt"
            type="number"
            name="durationInput"
            placeholder="Please input transaction amount"
          />
        </el-col>
      </el-form-item>
      <el-form-item :label="$t('sales.trnnote')">
        <el-col :span="11">
          <el-input
            v-model="form.TrnNote"
            type="textarea"
            placeholder="Please input transaction note"
          />
        </el-col>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit()">Update</el-button>
        <el-button @click="resetForm('form')">Reset</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import Resource from '@/api/resource';
const ModeResource = new Resource('findModesByComId');
const CompanyResource = new Resource('company');
const ProductResource = new Resource('FindProductByComId');
const SaleDailyResource = new Resource('sales');

export default {
  data() {
    return {
      listMode: {},
      listProduct: {},
      listcompany: {},
      obj_company: {},
      Companyfilter: true,
      trnproloading: true,
      trnmodeloading: true,
      form: {
        Company_id: '',
        PrName: '',
        TrnName: '',
        PrCode: '',
        TrnDate: '',
        TrnMode: '',
        ccy: '',
        TrnAmt: '',
        TrnNote: '',
        CompanyName: '',
        TrnModeName: '',
      },
      rules: {
        TrnName: [
          {
            required: true,
            message: 'Transaction Name is required',
            trigger: 'blur',
          },
        ],
        PrName: [
          {
            required: true,
            message: 'Please select Product',
            trigger: 'change',
          },
        ],
        TrnDate: [
          {
            required: true,
            message: 'transaction date is required',
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
        Company_id: [
          {
            required: true,
            message: 'Please select companyCode ',
            trigger: 'change',
          },
        ],
        TrnAmt: [
          {
            required: true,
            message: 'transaction amount is required',
            trigger: 'blur',
          },
        ],
      },
    };
  },
  watch: {
    $route: 'getList',
  },
  created() {
    this.getCompany();
    const id = this.$route.params && this.$route.params.id;
    this.getList(id);
    this.getProduct(id);
    this.getMode(id);
  },

  methods: {
    async getList(id) {
      const { data } = await SaleDailyResource.get(id);
      this.form = Object.assign({}, data);
    },
    // select data Product from table
    async getProduct(id) {
      id = this.form.Company_id;
      this.trnproloading = true;
      const { data } = await ProductResource.get(id);
      this.listProduct = data;
      this.trnproloading = false;
    },
    // select data Mdoe from table
    async getCompany() {
      this.Companyfilter = true;
      const { data } = await CompanyResource.list({});
      this.listcompany = data;
      this.Companyfilter = false;
    },
    async getMode(id) {
      id = this.form.Company_id;
      this.trnmodeloading = true;
      const { data } = await ModeResource.get(id);
      this.listMode = data;
      this.trnmodeloading = false;
    },
    updateField(field, value) {
      if (value.length === 0) {
        this.form[field] = 0;
      }

      this.form[field] = value;
    },
    handleFilter(event) {
      this.form.Company_id = event;
      this.Companyfilter = true;
      this.getProduct(this.form.Company_id);
      this.getMode(this.form.Company_id);
      this.Companyfilter = false;
    },
    // Update data for Sales
    onSubmit() {
      this.updating = true;
      console.log(this.form);
      SaleDailyResource.update(this.form.Id, this.form)
        .then(response => {
          this.updating = false;
          this.$message({
            message: 'Sales information has been updated successfully',
            type: 'success',
            duration: 5 * 1000,
          });
        })
        .catch(error => {
          console.log(error);
          this.updating = false;
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
</style>

