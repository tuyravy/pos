<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="160px">
      <el-form-item :label="$t('Total')">
        <el-col :span="6">
          <label>{{ form.SubTotal | numFormat('0,0.00') }}</label>
        </el-col>
        <el-col class="line" :span="10" style="text-align:right">{{ $t('Exchange') }}</el-col>
        <el-col :span="8">
          <label>{{ form.exchange | numFormat('0,0.00') }}</label>
        </el-col>
      </el-form-item>
      <el-form-item :label="$t('DeliveryCost')">
        <el-col :span="6">
          <label>{{ form.DeliveryCost | numFormat('0,0.00') }}</label>
        </el-col>
        <el-col class="line" :span="10" style="text-align:right">{{ $t('DiscountAmount') }}</el-col>
        <el-col :span="8">
          <label>{{ form.TotalDiscount | numFormat('0,0.00') }}</label>
        </el-col>
      </el-form-item>
      <el-form-item :label="$t('GrandTotal')">
        <el-col :span="6">
          <label>{{ form.GRANDTOTAL | numFormat('0,0.00') }}</label>
        </el-col>
        <el-col class="line" :span="10" style="text-align:right">{{ $t('GrandTotalឬiel') }}</el-col>
        <el-col :span="8">
          <label>{{ form.GrandTotalRiel | numFormat('0,0') }}</label>
        </el-col>
      </el-form-item>
      <pre />

      <el-form-item :label="$t('TotalPaid')" prop="TotalPaided">
        <el-col :span="24">
          <el-input v-model="form.TotalPaided" :placeholder="$t('TotalPaid')" :autofocus="true" />
        </el-col>
      </el-form-item>
      <el-form-item :label="$t('Return')" prop="AmountReturn">
        <el-col :span="24">
          <el-input v-model="form.AmountReturn" :placeholder="$t('Return')" />
        </el-col>
      </el-form-item>
      <el-form-item :label="$t('ReturnRiel')" prop="AmountRiel">
        <el-col :span="24">
          <el-input v-model="form.AmountRiel" :placeholder="$t('ReturnRiel')" />
        </el-col>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit()">{{ $t('Button.Paid') }}</el-button>
        <el-button @click="resetForm('form')">{{ $t('Button.Reset') }}</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import moment from 'moment';
const SummaryResource = new Resource('SummaryPayment');
const SaleDailyResource = new Resource('PaidedAmt');

export default {
  data() {
    return {
      Total: '',
      listsummary: {},
      form: {
        TotalPaided: '',
        AmountReturn: '',
        AmountRiel: '',
        SubTotal: 0,
        TaxAmount: 0,
        TotalDiscount: 0,
        DeliveryCost: 0,
        discount_percentage: 0,
        GrandTotal: 0,
        GrandTotalRiel: 0,
        exchange: 4000,
        sale_id: 0,
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
  watch: {
    $route: 'GetSummary',
  },
  created() {
    const id = this.$route.params && this.$route.params.id;
    this.GetSummary(id);
  },
  methods: {
    getTotal(){
      this.Total = this.$emit('getTotal');
    },
    async GetSummary(id) {
      this.loading = true;
      const { data } = await SummaryResource.get(id);
      this.form = Object.assign({}, data);
      this.form.SubTotal = data.SubTotal;
      this.form.TaxAmount = data.TaxAmount;
      this.form.DeliveryCost = data.DeliveryCost;
      this.form.TotalDiscount = data.TotalDiscount;
      this.form.GrandTotalRiel = data.GRANDTOTAL * 4000;
      this.GRANDTOTAL = data.GRANDTOTAL;
      this.form.sale_id = data.sale_id;
      this.form.discount_percentage = new Intl.NumberFormat('en-IN', {
        maximumSignificantDigits: 3,
      }).format(data.discount_percentage);
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    formatNumber(n) {
      // format number 1000000 to 1,234,567
      return n.replace(/\D/g, '').replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    },
    onSubmit() {
      this.$refs['form'].validate(valid => {
        if (valid) {
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
