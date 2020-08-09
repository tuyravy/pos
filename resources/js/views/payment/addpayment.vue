<template>
  <div class="app-container">
    <el-card>
      <el-tabs v-model="activeActivity">
        <el-tab-pane label="Project List" name="first" class="active">
          <el-form ref="form" :model="form" :rules="rules" label-width="170px">
            <el-form-item :label="$t('customer.customername')" prop="TrnName">
              <el-col :span="8">
                <el-input
                  v-model="form.amount"
                  type="number"
                  name="durationInput"
                  placeholder="Please input transaction amount"
                />
              </el-col>
              <el-col class="line" :span="3">{{ $t('customer.exchange') }}</el-col>
              <el-col :span="8">
                <el-input
                  v-model="form.amount"
                  type="number"
                  name="durationInput"
                  placeholder="Please input transaction amount"
                />
              </el-col>
            </el-form-item>
            <el-form-item :label="$t('customer.paymentterms')" prop="PrCode">
              <el-col :span="8">
                <el-select
                  v-model="form.PrCode"
                  v-loading="trnproloading"
                  placeholder="Please select your product"
                >
                  <el-option
                    v-for="item in list"
                    :key="item.prcode"
                    :label="item.FullDesc"
                    :value="item.prcode"
                  />
                </el-select>
              </el-col>
              <el-col class="line" :span="3">
                <span>{{ $t('customer.totalPaid') }}</span>
              </el-col>
              <el-col :span="8">
                <el-input
                  v-model="form.amount"
                  type="number"
                  name="durationInput"
                  placeholder="Please input transaction amount"
                />
              </el-col>
            </el-form-item>
            <el-form-item :label="$t('customer.reff_no')" prop="TrnDate">
              <el-col :span="8">
                <el-input
                  v-model="form.amount"
                  type="number"
                  name="durationInput"
                  placeholder="Please input transaction amount"
                />
              </el-col>
              <el-col class="line" :span="3">
                <span>{{ $t('customer.returnUSD') }}</span>
              </el-col>
              <el-col :span="8">
                <el-input
                  v-model="form.amount"
                  type="number"
                  name="durationInput"
                  placeholder="Please input transaction amount"
                />
              </el-col>
            </el-form-item>
            <el-form-item :label="$t('customer.paidby')" prop="TrnDate">
              <el-col :span="8">
                <el-input
                  v-model="form.amount"
                  type="number"
                  name="durationInput"
                  placeholder="Please input transaction amount"
                />
              </el-col>
              <el-col class="line" :span="3">
                <span>{{ $t('customer.returnRiel') }}</span>
              </el-col>
              <el-col :span="8">
                <el-date-picker
                  v-model="form.TrnDate"
                  type="date"
                  placeholder="Transaction date"
                  style="width: 100%;"
                />
              </el-col>
            </el-form-item>
            <el-form-item :label="$t('customer.collectby')" prop="TrnDate">
              <el-col :span="8">
                <el-input
                  v-model="form.amount"
                  type="number"
                  name="durationInput"
                  placeholder="Please input transaction amount"
                />
              </el-col>
              <el-col class="line" :span="3">
                <span>{{ $t('customer.paiddate') }}</span>
              </el-col>
              <el-col :span="8">
                <el-input
                  v-model="form.amount"
                  type="number"
                  name="durationInput"
                  placeholder="Please input transaction amount"
                />
              </el-col>
            </el-form-item>
            <el-form-item :label="$t('customer.cus_other_note')" prop="TrnDate">
              <el-col :span="11">
                <el-input
                  v-model="form.amount"
                  type="number"
                  name="durationInput"
                  placeholder="Please input transaction amount"
                />
              </el-col>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="onSubmit()">Create</el-button>
              <el-button @click="resetForm('form')">Reset</el-button>
            </el-form-item>
          </el-form>
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import moment from 'moment';
const ModeResource = new Resource('modes');
const CompanyResource = new Resource('company');
const ProductResource = new Resource('products');
const SaleDailyResource = new Resource('sales');
export default {
  data() {
    return {
      activeActivity: 'first',
      list: {},
      lists: {},
      listcompany: {},
      Companyfilter: true,
      trnproloading: true,
      trnmodeloading: true,
      form: {
        TrnName: '',
        PrCode: '',
        TrnDate: '',
        TrnMode: '',
        Currency: '',
        type: [],
        tranote: '',
        amount: '',
        CompanyCode: '',
        CompanyId: '',
      },
      rules: {
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
      },
    };
  },
  created() {
    this.getProduct();
    this.getMode();
    this.getCompany();
  },
  methods: {
    // select data Product from table
    async getProduct() {
      this.trnproloading = true;
      const { data } = await ProductResource.list(this.form);
      this.list = data;
      this.trnproloading = false;
    },
    // select data Mdoe from table
    async getCompany() {
      this.Companyfilter = true;
      const { data } = await CompanyResource.list({});
      this.listcompany = data;
      if (this.lists.length > 0) {
        this.form.TrnMode = this.lists[0];
      }
      this.Companyfilter = false;
    },
    async getMode() {
      this.trnmodeloading = true;
      const { data } = await ModeResource.list(this.form);
      this.lists = data;
      if (!data.length === 0) {
        this.form.TrnMode = this.lists[0];
      }
      this.trnmodeloading = false;
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    handleFilter() {
      this.Companyfilter = true;
      this.getProduct();
      this.form.TrnModeType = 'TrnMode';
      this.getMode();
      if (this.lists.length > 0) {
        this.form.TrnMode = this.lists[0];
      }
      this.Companyfilter = false;
    },

    onSubmit() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          this.form.TrnDate = this.backEndDateFormat(this.form.TrnDate);
          SaleDailyResource.store(this.form)
            .then(response => {
              this.$message({
                message: 'Sale has been created successfully.',
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
