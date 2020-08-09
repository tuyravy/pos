
<template>
  <div class="app-container">
    <el-card>
      <el-tabs v-model="activeActivity">
        <el-tab-pane label="Sale Detail" name="first" class="active">
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <el-button
                style="float: right; padding: 3px 5px"
                type="text"
                class="el-icon-download"
              >Excel</el-button>
              <el-button
                style="float: right; padding: 3px 5px"
                type="text"
                class="el-icon-printer"
                @click="handleInvice"
              >Print</el-button>
            </div>
            <div id="printMe" class="page" style="margin-top:-10px;">
              <el-row :gutter="20">
                <el-col :span="3">
                  <img src="images/logo.jpg" style="width:100%;">
                </el-col>
                <el-col :span="10">
                  <span style="font-weight:bold;font-size:20px;margin-left:-12px;">RKS Co., Ltd.</span>
                  <p style="font-weight:bold;margin-left:-12px;">Raksmei Kuchsa</p>
                </el-col>
                <el-col :span="11">
                  <span style="font-size:12px;">
                    <span style="font-weight:bold">Adress:</span> #271, Corner 432 Sangkat Toul Tumpong 2, 12311
                  </span>
                  <p style="font-size:12px;">
                    <span>
                      <span span style="font-weight:bold">Phone:</span> 012 810 821
                    </span>
                    <span>
                      <span style="font-weight:bold">Email:</span> sopheap.long@rks-kh.com
                    </span>
                  </p>
                  <p style="font-size:12px;">
                    <span style="font-weight:bold">Website:</span> wwww.rsk-kh.com
                  </p>
                </el-col>
              </el-row>
              <el-row :gutter="20">
                <pre>
                  <hr>
                </pre>
              </el-row>
              <el-row :gutter="20" style="text-align:center;">
                <span style="font-weight:bold;font-size:22px;">Sale Detail</span>
                <p>
                  <span>View Date:{{ backEndDateFormat(new Date()) }}</span>
                </p>
              </el-row>
              <el-col :span="13">
                <pre />
                <span style="font-weight:bold">Products</span>
                <pre />
              </el-col>
              <el-table
                :data="list"
                border
                fit
                highlight-current-row
                style="width: 100%"
                align="right"
              >
                <el-table-column align="left" label="Item Descrition" width="240">
                  <template slot-scope="scope">
                    <span>{{ scope.row.productname }}</span>
                  </template>
                </el-table-column>
                <el-table-column align="right" label="Unit Price" width="160">
                  <template slot-scope="scope">
                    <span>{{ scope.row.displayprice | numFormat('0,0.00') }}</span>
                  </template>
                </el-table-column>
                <el-table-column align="center" label="Qty" width="150">
                  <template slot-scope="scope">
                    <span>{{ scope.row.qty }}</span>
                  </template>
                </el-table-column>
                <!-- <el-table-column align="right" label="Tax (%)" width="150">
              <template slot-scope="scope">
                <span>{{ scope.row.product_Tax }}</span>
              </template>
                </el-table-column>-->
                <el-table-column align="right" label="Total" width="160">
                  <template slot-scope="scope">
                    <span style="margin-right:0px">{{ scope.row.total | numFormat('0,0.00') }}</span>
                  </template>
                </el-table-column>
              </el-table>
              <el-row :gutter="20">
                <el-col :span="13">
                  <pre />
                  <span style="font-weight:bold">Payments</span>
                </el-col>
                <pre />
              </el-row>
              <el-row :gutter="20">
                <el-col :span="24">
                  <template>
                    <el-table style="width: 100%">
                      <el-table-column prop="Name" label="Name" width="240" />
                      <el-table-column prop="Total" label="Total" width="260" />
                      <el-table-column prop="Other" label="Other" width="210" />
                    </el-table>
                  </template>
                </el-col>
              </el-row>
              <el-row :gutter="20">
                <el-col :span="13">
                  <pre />
                  <span style="font-weight:bold">Taxes</span>
                </el-col>
                <pre />
              </el-row>
              <el-row :gutter="20">
                <el-col :span="24">
                  <template>
                    <el-table style="width: 100%">
                      <el-table-column prop="Name" label="Name" width="340" />
                      <el-table-column prop="Other" label="Total" width="350" />
                    </el-table>
                  </template>
                </el-col>
              </el-row>
            </div>
          </el-card>
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import moment from 'moment';
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directive

const SaleDailyResource = new Resource('ViewDetailItem');
const SaleResource = new Resource('DraftSale');

export default {
  directives: { waves, permission },
  data() {
    return {
      DateNow: '',
      activeActivity: 'first',
      SubTotal: 0,
      TotalDiscount: 0,
      TaxAmount: 0,
      GRANDTOTAL: 0,
      redirect: undefined,
      list: [],
      loading: true,
      viewlist: {},
      formLabelWidth: '100px',
      saleid: '',
      form: {},
    };
  },
  watch: {
    $route: 'getList',
  },
  mounted(){
    this.$router.push('/sales/sale_detail/view/' + this.saleid);
  },
  created() {
    const id = this.$route.params && this.$route.params.id;
    this.saleid = id;
    this.getList(id);
    this.getDraft();
  },
  methods: {
    async getList(id) {
      this.loading = true;
      const { data } = await SaleDailyResource.get(id);
      this.list = data.items;
      this.SubTotal = data.SubTotal;
      this.TotalDiscount = data.TotalDiscount;
      this.TaxAmount = data.TaxAmount;
      this.GRANDTOTAL = data.GRANDTOTAL;
      this.getDraft(data.invoice_no);
      this.loading = false;
    },
    async getDraft(invoice_no) {
      this.loading = true;
      const { data, sale_date } = await SaleResource.get(invoice_no);
      this.form = Object.assign({}, data);
      this.form.DateNow = sale_date;
      this.loading = false;
    },
    handleInvice() {
      var divElements = document.getElementById('printMe').innerHTML;
      var oldPage = document.body.innerHTML;
      document.body.innerHTML =
        '<html><head><title></title></head><body>' + divElements + '</body>';
      window.print();
      document.body.innerHTML = oldPage;
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
  },
};
</script>

<style lang="scss" scoped>
@page {
  size: A4;
  margin: 10;
}
.el-table th {
  background: #1e9fda;
  color: white;
  pointer-events: none;
  font-size: 10px;
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
  .page {
    width: 21cm;
    min-height: 29.7cm;
    padding: 1cm;
    margin: 1cm auto;
    border: 1px #d3d3d3 solid;
    border-radius: 5px;
    background: white;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  }
  @media print {
    .page {
      margin: 0;
      border: initial;
      border-radius: initial;
      width: initial;
      min-height: initial;
      box-shadow: initial;
      background: initial;
      page-break-after: always;
    }
  }
}
</style>
