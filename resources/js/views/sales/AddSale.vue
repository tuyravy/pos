<template>
  <div class="app-container">
    <el-card>
      <el-tabs v-model="activeActivity">
        <el-tab-pane :label="$t('filter')" name="first" class="active">
          <el-form
            ref="form"
            :model="form"
            :rules="rules"
            class="demo-form-inline"
            label-width="150"
          >
            <el-row :gutter="8">
              <el-form-item
                :label="$t('FindProduct')"
                style="margin-left: 15px"
              >
                <el-button
                  type="primary"
                  icon="el-icon-plus"
                  style="margin-left: -50px"
                  @click="onSubmit()"
                >
                  {{ $t('Button.AddToList') }}
                </el-button>
                <el-col :xs="24" :sm="6" :md="16" :lg="14" :xl="11">
                  <el-autocomplete
                    v-model="form.product_code"
                    popper-class="my-autocomplete"
                    :fetch-suggestions="querySearch"
                    :placeholder="$t('ProductHolder')"
                    :debounce="500"
                    style="width: 650px"
                    @select="handleSelect"
                  >
                    <i
                      slot="suffix"
                      class="el-icon-edit el-input__icon"
                      @click="handleIconClick"
                    />

                    <template slot-scope="{ item }">
                      <div class="value">
                        <img
                          :src="'/images/product.png'"
                          class="rounded-circle z-depth-2"
                          rounded="circle"
                          alt="100x100"
                          style="float: left; width: 60px"
                          data-holder-rendered="true"
                        >
                        <p style="float: left; margin-top: -5px" />
                        <li>
                          <small>{{ item.value }}</small>
                        </li>
                        <li>
                          <small class="link">{{ item.link }}</small>
                        </li>
                      </div>
                    </template>
                  </el-autocomplete>
                </el-col>
              </el-form-item>
            </el-row>
          </el-form>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <pre />
    <el-card>
      <div slot="header" class="clearfix">
        <el-button
          style="float: left; padding: 3px 5px; color: black; font-weight: bold"
          type="text"
        >
          {{ $t('ProductList') }}
        </el-button>
      </div>
      <el-form
        ref="form"
        :model="form"
        :rules="rules"
        class="demo-form-inline"
        label-width="150px"
      >
        <el-form-item :label="$t('ChooseOption')" prop="chooseoption">
          <el-select
            v-model="form.chooseoption"
            filterable
            placeholder="Choose Option"
            @change="handleChooseOption"
          >
            <el-option
              v-for="(item, index) in optionlist"
              :key="item.index"
              :label="item"
              :value="index + 1"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <el-table :data="list" :summary-method="getSummaries" show-summary>
        <el-table-column
          :label="$t('table.Actions')"
          prop="Action"
          width="100"
          align="center"
        >
          <template slot-scope="scope">
            <i
              class="el-icon-delete"
              style="color: red; cursor: pointer"
              @click="handleRemove(scope.row.id)"
            />
            <!-- <i class="el-icon-edit" style="color:red;cursor: pointer;" @click="scope.row.edit=!scope.row.edit" /> -->
            <i
              v-if="scope.row.edit"
              class="el-icon-circle-check"
              style="color: #489ee7; cursor: pointer"
              @click="confirmEdit(scope.row)"
            />
            <i
              v-else
              class="el-icon-edit-outline"
              style="color: red; cursor: pointer"
              @click="scope.row.edit = !scope.row.edit"
            />
          </template>
        </el-table-column>
        <el-table-column
          sortable
          :label="$t('table.ProductName')"
          prop="productname"
        >
          <template slot-scope="scope">
            <span>{{ scope.row.productcode }}-{{ scope.row.productname }}</span>
          </template>
        </el-table-column>
        <el-table-column
          sortable
          :label="$t('table.Price')"
          align="center"
          prop="displayprice"
        >
          <template slot-scope="scope">
            <template v-if="scope.row.edit && form.chooseoption == 4">
              <el-input
                v-model="scope.row.displayprice"
                class="edit-input"
                size="small"
              />
              <el-button
                class="cancel-btn"
                size="small"
                icon="el-icon-refresh"
                type="warning"
                @click="cancelEdit(scope.row)"
              />
            </template>
            <span v-else>{{ scope.row.displayprice }}</span>
          </template>
        </el-table-column>
        <el-table-column
          sortable
          :label="$t('table.Qty')"
          min-width="80px"
          align="center"
          prop="qty"
        >
          <template slot-scope="scope">
            <template v-if="scope.row.edit">
              <el-input
                v-model="scope.row.qty"
                class="edit-input"
                size="small"
              />
              <el-button
                class="cancel-btn"
                size="mini"
                icon="el-icon-refresh"
                type="warning"
                style="margin-top: -4px"
                @click="cancelEdit(scope.row)"
              />
            </template>
            <span v-else>{{ scope.row.qty }}</span>
          </template>
        </el-table-column>
        <el-table-column
          sortable
          :label="$t('table.Discount')"
          prop="discount_percentage"
        >
          <template slot-scope="scope">
            <span>{{ scope.row.discount_percentage }}</span>
          </template>
        </el-table-column>
        <!-- <el-table-column prop="product_Tax" label="Vat 10%">
          <template slot-scope="scope">
            <span>{{ scope.row.product_Tax }}</span>
          </template>
        </el-table-column>-->
        <el-table-column prop="total" sortable :label="$t('table.Total')">
          <template slot-scope="scope">
            <span>{{ scope.row.total | numFormat('0,0.00') }}</span>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <pre />
    <el-row :gutter="24">
      <el-col
        :xs="{ span: 24 }"
        :sm="{ span: 24 }"
        :md="{ span: 24 }"
        :lg="{ span: 12 }"
        :xl="{ span: 12 }"
        style="padding-right: 8px; margin-bottom: 30px"
      >
        <el-card>
          <el-tabs v-model="activeActivity">
            <el-tab-pane :label="$t('SaleInfo')" name="first" class="active">
              <el-form
                ref="form"
                :model="form"
                :rules="rules"
                label-width="160px"
              >
                <el-form-item :label="$t('SaleDate')" prop="SaleDate">
                  <el-col :span="24">
                    <el-date-picker
                      v-model="form.SaleDate"
                      type="date"
                      :placeholder="$t('SaleDate')"
                      style="width: 100%"
                      :disabled="true"
                    />
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('SaleMan')" prop="SystemId">
                  <el-col :span="24">
                    <el-select
                      v-model="form.SystemId"
                      filterable
                      :placeholder="$t('SaleMan')"
                    >
                      <el-option value="1" label="None">None</el-option>
                      <el-option
                        v-for="item in SaleManList"
                        :key="item.System_Id"
                        :label="item.StaffNameEng"
                        :selected="item.System_Id == '558'"
                        :value="item.System_Id"
                      />
                    </el-select>
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('CustomerName')" prop="CusId">
                  <el-col :span="12">
                    <el-select
                      v-model="form.CusId"
                      filterable
                      :placeholder="$t('CustomerName')"
                      @change="handleFilter"
                    >
                      <el-option
                        v-for="item in ListCustomer"
                        :key="item.cus_id"
                        :label="item.customer"
                        :value="item.cus_id"
                      />
                    </el-select>
                  </el-col>
                  <el-col class="line" :span="2">
                    <router-link to="/customer/AddCustomer/">
                      <el-button type="primary" icon="el-icon-plus" />
                    </router-link>
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('ProjectName')" prop="ProjectId">
                  <el-col :span="12">
                    <el-select
                      v-model="form.ProjectId"
                      :placeholder="$t('ProjectName')"
                    >
                      <el-option
                        v-for="item in ProjectList"
                        :key="item.project_id"
                        :label="item.project_name_eng"
                        :value="item.project_id"
                      />
                    </el-select>
                  </el-col>
                  <el-col class="line" :span="2">
                    <router-link to="/project/addproject/">
                      <el-button type="primary" icon="el-icon-plus" />
                    </router-link>
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('PaymentTerms')" prop="PaymentMothod">
                  <el-col :span="24">
                    <el-select
                      v-model="form.PaymentMothod"
                      placeholder="Payment Terms"
                      filterable
                      @change="handleFilterPaymentMothod"
                    >
                      <el-option
                        v-for="item in PaymentMothodList"
                        :key="item.look_id"
                        :label="item.full_name_en"
                        :value="item.look_id"
                      />
                    </el-select>
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('DeliveryBy')">
                  <el-col :span="24">
                    <el-select
                      v-model="form.DeliveryBy"
                      filterable
                      :placeholder="$t('DeliveryBy')"
                    >
                      <el-option value="1" label="None">None</el-option>
                      <el-option
                        v-for="item in DeliveryList"
                        :key="item.System_Id"
                        :label="item.StaffNameEng"
                        :value="item.System_Id"
                      />
                    </el-select>
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('WarehouseName')">
                  <el-col :span="24">
                    <el-select
                      v-model="form.WarehouseName"
                      filterable
                      :placeholder="$t('WarehouseName')"
                    >
                      <el-option value="1" label="None">None</el-option>
                      <el-option
                        v-for="item in DeliveryList"
                        :key="item.System_Id"
                        :label="item.StaffNameEng"
                        :value="item.System_Id"
                      />
                    </el-select>
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('DeliveryCost')">
                  <el-col :span="24">
                    <el-input
                      v-model="form.DeliveryCost"
                      :placeholder="$t('DeliveryCost')"
                      @change="HandleDeliveryCode"
                    />
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('Reff_no')" prop="reff_no">
                  <el-col :span="24">
                    <el-input
                      v-model="form.reff_no"
                      :placeholder="$t('Reff_no')"
                    />
                  </el-col>
                </el-form-item>

                <el-form-item :label="$t('DeliveryDate')" prop="DeliveryDate">
                  <el-col :span="24">
                    <el-date-picker
                      v-model="form.DeliveryDate"
                      type="date"
                      :placeholder="$t('DeliveryDate')"
                      style="width: 100%"
                    />
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('Document')">
                  <fileUpload />
                </el-form-item>
                <el-form-item :label="$t('DeliveryNote')">
                  <el-col :span="24">
                    <el-input
                      v-model="form.DeliveryNoted"
                      type="textarea"
                      :placeholder="$t('DeliveryNote')"
                    />
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('DeliveryAddress')">
                  <el-col :span="24">
                    <el-input
                      v-model="form.DeliveryAddress"
                      type="textarea"
                      :placeholder="$t('DeliveryAddress')"
                    />
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('Noted')">
                  <el-col :span="24">
                    <el-input
                      v-model="form.Noted"
                      type="textarea"
                      :placeholder="$t('Noted')"
                    />
                  </el-col>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="onSubmitCustomer()">{{
                    $t('Button.Create')
                  }}</el-button>
                  <el-button @click="resetForm('form')">{{
                    $t('Button.Reset')
                  }}</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
      <el-col
        :xs="{ span: 24 }"
        :sm="{ span: 24 }"
        :md="{ span: 23 }"
        :lg="{ span: 12 }"
        :xl="{ span: 12 }"
        style="margin-bottom: 30px"
      >
        <el-card>
          <el-tabs v-model="activeActivity">
            <el-tab-pane :label="$t('PaymentInfo')" name="first" class="active">
              <el-form
                ref="form"
                :model="form"
                :rules="rules"
                label-width="160px"
              >
                <el-form-item :label="$t('Total')">
                  <el-col :span="6">
                    <label>{{ Total | numFormat('0,0.00') }}</label>
                  </el-col>
                  <el-col class="line" :span="10" style="text-align: right">{{
                    $t('Exchange')
                  }}</el-col>
                  <el-col :span="8">
                    <label>{{ form.exchange | numFormat('0,0.00') }}</label>
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('DeliveryCost')">
                  <el-col :span="6">
                    <label>{{ form.DeliveryCost | numFormat('0,0.00') }}</label>
                  </el-col>
                  <el-col class="line" :span="10" style="text-align: right">{{
                    $t('DiscountAmount')
                  }}</el-col>
                  <el-col :span="8">
                    <label>{{
                      form.TotalDiscount | numFormat('0,0.00')
                    }}</label>
                  </el-col>
                </el-form-item>
                <el-form-item :label="$t('GrandTotal')">
                  <el-col :span="6">
                    <label>{{ form.GRANDTOTAL | numFormat('0,0.00') }}</label>
                  </el-col>
                  <el-col class="line" :span="10" style="text-align: right">{{
                    $t('GrandTotalឬiel')
                  }}</el-col>
                  <el-col :span="8">
                    <label>{{ form.GrandTotalRiel | numFormat('0,0') }}</label>
                  </el-col>
                </el-form-item>
                <pre />
              </el-form>
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<style>
.el-table th {
  background-color: rgba(192, 229, 253, 0.5);
  color: black;
  padding: 3px !important;
}
.el-table td {
  padding: 6px !important;
}
#tab-first {
  color: black;
  font-weight: bold;
}
div.el-tabs__active-bar.is-top {
  background-color: #e6ebf5;
}
</style>
<script>
import Resource from '@/api/resource';
import moment from 'moment';
import fileUpload from './components/uploadfile';

const AddToListResource = new Resource('addtolist');
const ListTempTableResource = new Resource('listtempProduct');
const RemoveListTempResource = new Resource('removeTempProduct');
const ProductResource = new Resource('ScanProduct');
const PlistbyOptionResource = new Resource('ProductlistbyOption');
const UpdatePricebyOptionResource = new Resource('UpdatePricebyOption');
const SaleMenResource = new Resource('Saleman');
const CustomerResource = new Resource('customer');
const SaleDailyResource = new Resource('sales');
const PaymentMothodResource = new Resource('PaymentMothod');
const DeliveryResource = new Resource('DeliveryPersion');
const ProjectNameByCusIdResource = new Resource('GetProjectName');

export default {
  components: { fileUpload },
  data() {
    return {
      Total: 0,
      links: [],
      TotalDeliveryCost: 0,
      activeActivity: 'first',
      tabIndex: 0,
      list: [],
      optionlist: ['តម្លៃទូទៅ', 'តម្លៃលក់រាយ', 'តម្លៃលក់ដុំ', 'តម្លៃលក់ពិសេស'],
      lists: {},
      loading: false,
      active: 1,
      Inactive: 0,
      editPrice: {},
      listcompany: {},
      Companyfilter: true,
      trnproloading: true,
      trnmodeloading: true,
      DeliveryCostPublic: 0,
      SaleManList: {},
      PaymentMothodList: {},
      DeliveryList: {},
      ListCustomer: {},
      AlertTopaid: '',
      ProjectList: {},
      Loading: false,
      form: {
        state: '',
        chooseoption: 1,
        DeliveryAddress: '',
        DeliveryNoted: '',
        DeliveryDate: this.backEndDateFormat(new Date()),
        SaleDate: this.backEndDateFormat(new Date()),
        reff_no: '',
        DeliveryCost: '',
        DeliveryBy: '',
        PaymentMothod: '',
        CusId: '',
        SystemId: '',
        ProjectId: '',
      },
      rules: {
        state: [
          {
            required: true,
            message: 'Product search is required',
            trigger: 'blur',
          },
        ],
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
    $route: 'HandleDeliveryCode',
  },
  mounted() {
    this.links = this.FindProduct();
    this.GetListProTemp();
  },
  created() {
    this.GetListProTemp();
    this.DeliveryCost();
    this.getCompany();
    this.getSaleMan();
    this.getPaymentMothod();
    this.getDelivery();
    this.getProjectByCusId();
    this.HandleDeliveryCode();
  },
  methods: {
    getSummaries(param) {
      const { columns, data } = param;
      const sums = [];
      columns.forEach((column, index) => {
        if (index === 1) {
          sums[index] = this.$t('table.GrandTotal');
          return;
        }
        const values = data.map((item) => Number(item[column.property]));
        if (!values.every((value) => isNaN(value))) {
          if (index === 2 || index === 5) {
            sums[index] =
              '$  ' +
              values.reduce((prev, curr) => {
                const value = Number(curr);
                if (!isNaN(value)) {
                  this.Total = prev + curr;
                  return prev + curr;
                } else {
                  return prev;
                }
              }, 0);
          } else {
            sums[index] = values.reduce((prev, curr) => {
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
    next() {
      if (this.active++ > 3) {
        this.active = 1;
      }
    },
    backnext() {
      if (this.active-- < 3) {
        this.Inactive = this.active;
        console.log(this.active);
      }
    },
    querySearch(queryString, cb) {
      var links = this.links;
      var results = queryString
        ? links.filter(this.createFilter(queryString))
        : links;
      // call callback function to return suggestion objects
      cb(results);
    },
    async FindProduct() {
      const { data } = await ProductResource.list();
      this.links = data;
    },
    async DeliveryCost() {
      console.log(this.DeliveryCost);
    },
    async GetListProTemp() {
      this.loading = true;
      const { data } = await ListTempTableResource.list();
      const tableData = data.items;
      this.list = tableData.map((v) => {
        this.$set(v, 'edit', false);
        v.qtyoriginal = v.qty;
        v.unit_priceorig = v.displayprice; // https://vuejs.org/v2/guide/reactivity.html//  will be used when user click the cancel botton
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
        .catch((error) => {
          console.log(error);
        });
    },
    cancelEdit(row) {
      row.qty = row.qtyoriginal;
      row.displayprice = row.unit_priceorig;
      row.edit = false;
      this.$message({
        message: 'The title has been restored to the original value',
        type: 'warning',
      });
    },
    confirmEdit(row) {
      row.edit = false;
      row.qtyoriginal = row.qty;
      row.unit_priceorig = row.displayprice;
      this.editPrice = {
        productcode: row.productcode,
        qty: row.qty,
        displayprice: row.displayprice,
        chooseoption: this.form.chooseoption,
      };
      UpdatePricebyOptionResource.store(this.editPrice)
        .then((response) => {
          this.$message({
            message: 'The information has been edited',
            type: 'success',
          });
          this.GetListProTemp();
        })
        .catch((error) => {
          console.log(error);
        });
    },
    handleChooseOption() {
      PlistbyOptionResource.update(this.form.chooseoption)
        .then((response) => {
          this.$message({
            message: 'Product information has been change option sale',
            type: 'success',
            duration: 5 * 1000,
          });
          this.GetListProTemp();
        })
        .catch((error) => {
          console.log(error);
        });
    },
    createFilter(queryString) {
      return (link) => {
        return (
          link.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0
        );
      };
    },
    handleSelect(item) {
      console.log(item);
      this.onSubmit();
    },
    handleIconClick(ev) {
      console.log(ev);
      this.form.product_code = '';
    },
    onSubmit() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          AddToListResource.store(this.form)
            .then((response) => {
              this.$message({
                message: 'Sale has been created successfully.',
                type: 'success',
                duration: 5 * 1000,
              });
              this.GetListProTemp();
            })
            .catch((error) => {
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
    async getCompany() {
      const { data } = await CustomerResource.list({});
      this.ListCustomer = data;
    },
    async getSaleMan() {
      const { data } = await SaleMenResource.list();
      this.SaleManList = data;
    },
    async getPaymentMothod() {
      const { data } = await PaymentMothodResource.list();
      this.PaymentMothodList = data;
    },
    async getDelivery() {
      const { data } = await DeliveryResource.list();
      this.DeliveryList = data;
    },
    async getProjectByCusId() {
      const { data } = await ProjectNameByCusIdResource.get(this.form.CusId);
      this.ProjectList = data;
    },
    HandleDeliveryCode() {
      this.DeliveryCostPublic = this.form.DeliveryCost;
      return this.DeliveryCostPublic;
    },
    handleFilterPaymentMothod() {
      this.getPaymentMothod();
    },
    handleFilter() {
      this.Loading = true;
      this.getProjectByCusId();
      this.Loading = false;
    },
    backEndDateFormat(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    onSubmitCustomer() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          SaleDailyResource.store(this.form)
            .then((response) => {
              this.$router.push('/sales/draftpayment/view/' + response.data.sale_id);
              this.$message({
                message: 'Sale has been created successfully.',
                type: 'success',
                duration: 5 * 1000,
              });
              // if (
              //   response.data.repayment_status === 'SRPM001' ||
              //   response.data.repayment_status === 'SRPM003'
              // ) {
              //   this.AlertTopaid = 'សូមកុំភ្លេចបង់ប្រាក់';
              // } else {
              //   this.$router.push('/sales/draftpayment/view/' + response.data.sale_id);
              // }
            })
            .catch((error) => {
              console.log(error);
            });
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
  },
};
</script>
<style scoped>
.line {
  text-align: center;
}
#el-autocomplete {
  border: 2px red solid;
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
