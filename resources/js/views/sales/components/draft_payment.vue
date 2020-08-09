
<template>
  <div class="app-container">
    <el-card>
      <el-tabs v-model="activeActivity">
        <el-tab-pane label="Item List" name="first" class="active">
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <el-button
                style="float: right; padding: 3px 5px"
                type="text"
                class="el-icon-printer"
                @click="handleInvice"
              >Invoice</el-button>
              <el-button
                style="float: right; padding: 3px 0"
                type="text"
                class="el-icon-money"
                @click="dialog = true"
              >Payment</el-button>
              <el-button
                style="float: right; padding: 3px 5px"
                type="text"
                class="el-icon-document"
              >Quotation</el-button>
              <span style="float: right; padding: 3px 0"><label style="color:#1890ff;font-size:12px;border-color:transparent;">Header Invoice</label>
                <el-switch v-model="form.headerinvoice" @change="switchHeader" /></span>
            </div>

            <div id="printMe">
              <header v-if="form.headerinvoice==true">
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
              </header>
              <main>
                <page size="A4" layout="portrait" name="page">
                  <el-row :gutter="20">
                    <pre />
                  </el-row>
                  <el-row :gutter="20">
                    <el-col :span="12">
                      <span style="font-size:12px;">INVOICE TO</span>
                      <p
                        style="font-size:16px;font-weight:bold"
                      >{{ form.firstName }} {{ form.familyName }}</p>
                      <p style="font-size:12px;">{{ form.Position }}</p>
                      <p>
                        <span icons="eye" style="font-size:12px;">Address: {{ form.address_detail }}</span>
                      </p>
                      <p style="font-size:12px;">
                        <span>P: {{ form.phone }}</span>
                      </p>
                      <p>
                        <span>E: {{ form.email }}</span>
                      </p>
                    </el-col>
                    <el-col :span="9" style="margin-top:-20px;">
                      <span style="font-weight:bold;font-size:22px;">INVOICE</span>
                      <p style="font-size:12px;margin-top:-2px;">
                        No:
                        <span>{{ form.invoice_no }}</span>
                      </p>
                      <pre><hr style="width:100px;" align="left"></pre>
                      <p style="margin-bottom:-10px;font-size:12px">
                        <span>Invoice Date:</span>
                      </p>
                      <p>
                        <span style="font-weight:bold;">{{ form.DateNow }}</span>
                      </p>
                    </el-col>
                  </el-row>
                  <el-table
                    :data="list"
                    border
                    fit
                    highlight-current-row
                    style="width: 100%"
                    align="right"
                  >
                    <el-table-column align="left" label="Item" width="230">
                      <template slot-scope="scope">
                        <span>{{ scope.row.productname }}</span>
                      </template>
                    </el-table-column>
                    <el-table-column align="center" label="Unit Price" width="160">
                      <template slot-scope="scope">
                        <span>{{ scope.row.displayprice | numFormat('0,0.00') }}</span>
                      </template>
                    </el-table-column>
                    <el-table-column align="center" label="Qty" width="160">
                      <template slot-scope="scope">
                        <span>{{ scope.row.qty }}</span>
                      </template>
                    </el-table-column>
                    <!-- <el-table-column align="right" label="Tax (%)" width="150">
              <template slot-scope="scope">
                <span>{{ scope.row.product_Tax }}</span>
              </template>
                    </el-table-column>-->
                    <el-table-column align="center" label="Total" width="160">
                      <template slot-scope="scope">
                        <span style="margin-right:0px">{{ scope.row.total | numFormat('0,0.00') }}</span>
                      </template>
                    </el-table-column>
                  </el-table>
                  <el-row :gutter="20">
                    <el-col :span="13">
                      <pre />
                      <span style="font-weight:bold">Payment Method</span>
                      <p>by Cash</p>
                    </el-col>
                    <el-col :span="11">
                      <div class="el-table" align="right">
                        <table style="width: 100%">
                          <tr>
                            <td style="text-align:right">Sub Total:</td>
                            <td
                              style="text-align:center;width:50%"
                            >{{ SubTotal | numFormat('0,0.00') }}</td>
                          </tr>
                          <tr>
                            <td style="text-align:right">Discount 5%:</td>
                            <td
                              style="text-align:center;width:50%"
                            >{{ TotalDiscount | numFormat('0,0.00') }}</td>
                          </tr>
                          <tr>
                            <td style="text-align:right">Tax Vat 10%:</td>
                            <td
                              style="text-align:center;width:50%"
                            >{{ TaxAmount | numFormat('0,0.00') }}</td>
                          </tr>
                          <tr>
                            <td style="text-align:right">Total Due:</td>
                            <td
                              style="text-align:center;width:50%"
                            >{{ form.balancedue | numFormat('0,0.00') }}</td>
                          </tr>
                          <tr>
                            <td style="text-align:right;font-weight:bold">Grand Total:</td>
                            <td
                              style="text-align:center;width:50%;font-weight:bold"
                            >{{ GRANDTOTAL | numFormat('0,0.00') }}</td>
                          </tr>
                        </table>
                      </div>
                      <pre />
                      <span style="font-size:12px;margin-bottom:10px;">Account Manager</span>
                      <p style="font-weight:bold">Jub Chinda</p>
                      <pre />
                      <pre />
                    </el-col>
                  </el-row>
                  <pre><hr></pre>
                </page>
              </main>
              <footer>
                <el-row :gutter="20">
                  <el-col>
                    <span style="font-weight:bold">Terms & Conditions</span>
                    <p
                      style="font-size:12px"
                    >1. The Seller Shall not be liable to the buyer directly or indirectly for any loss or change suffened by the buyer.</p>
                    <p
                      style="font-size:12px"
                    >2. The Seller warrants the product for one(1) year from the done of shipment.</p>
                    <p
                      style="font-size:12px"
                    >3. Any purchase order received by the seller will be interpesed as accepting this offer and the .</p>
                  </el-col>
                </el-row>
              </footer>
            </div>
          </el-card>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <el-drawer
      title="Payment Confirm"
      :before-close="handleClose"
      :visible.sync="dialog"
      direction="rtl"
      size="50%"
    >
      <div class="demo-drawer__content">
        <paymentinfo />
        <div class="demo-drawer__footer" />
      </div>
    </el-drawer>
    <el-drawer
      :before-close="handleClose"
      :visible.sync="dialogInvoice"
      direction="rtl"
      size="100%"
    >
      <div class="demo-drawer__content">
        <Invoice />
        <div class="demo-drawer__footer" />
      </div>
    </el-drawer>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import moment from 'moment';
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directive
import paymentinfo from './paymentinfo';
// import setting from '../../configuration/SettingPayment/Setting';
const SaleDailyResource = new Resource('ProListDraft');
const SaleResource = new Resource('DraftSale');

export default {
  directives: { waves, permission },
  components: { paymentinfo },
  data() {
    return {
      DateNow: '',
      dialog: false,
      dialogInvoice: false,
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
      form: {
        headerinvoice: false,
      },
    };
  },
  watch: {
    $route: 'getList',
  },
  created() {
    const id = this.$route.params && this.$route.params.id;
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
      window.location.reload();
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    handleClose(done) {
      this.$confirm('Do you want to cancel this transaction?')
        .then(_ => {
          this.loading = true;
          this.timer = setTimeout(() => {
            done();
            // animation takes time
          }, 500);
        })
        .catch(_ => {});
    },
    cancelForm() {
      this.loading = false;
      this.dialog = false;
      clearTimeout(this.timer);
    },
    switchHeader(){
      this.handleInvice = true;
      console.log(this.handleInvice);
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
  #printMe {
    width: 21cm;
    min-height: 29.7cm;
    padding: 1cm;
    margin: 1cm auto;
    border: 1px #d3d3d3 solid;
    border-radius: 5px;
    background: white;
    position: relative;
    display: block;
    margin: 0 auto;
    margin-bottom: 0.5cm;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  }
  // page {
  //   // width: 21cm;
  //   // min-height: 29.7cm;
  //   padding: 1cm;
  //   margin: 1cm auto;
  //   border: 1px #d3d3d3 solid;
  //   border-radius: 5px;
  //   background: white;
  //   position: relative;
  //   display: block;
  //   margin: 0 auto;
  //   margin-bottom: 0.5cm;
  //   box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  // }
  @media print {
    page {
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

  page[size='A4'] {
    width: 21cm;
    height: 29.7cm;
  }
  page[size='A4'][layout='portrait'] {
    width: 29.7cm;
    height: 21cm;
  }
  page[size='A3'] {
    width: 29.7cm;
    height: 42cm;
  }
  page[size='A3'][layout='portrait'] {
    width: 42cm;
    height: 29.7cm;
  }
  page[size='A5'] {
    width: 14.8cm;
    height: 21cm;
  }
  page[size='A5'][layout='portrait'] {
    width: 21cm;
    height: 14.8cm;
  }
  main {
    height: auto;
  }

  footer {
    position: absolute;
    left: 0;
    right: 0;
    background-color: #ccc;
    padding-right: 1.5cm;
    padding-left: 1.5cm;
  }
  // header,
  // header {
  //   top: 0;
  //   position: absolute;
  //   padding-top: 5mm;
  //   padding-bottom: 3mm;
  // }
  footer {
    bottom: 0;
    padding-top: 3mm;
    padding-bottom: 5mm;
  }

  @media print {
    body,
    page {
      margin: 0;
      box-shadow: 0;
    }
    header,
    footer {
      position: fixed;
      left: 0;
      right: 0;
      background-color: #ccc;
      padding-right: 1.5cm;
      padding-left: 1.5cm;
    }
  }
}
</style>
