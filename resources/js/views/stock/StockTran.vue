<template>
  <div class="app-container">
    <el-card>
      <el-tabs v-model="activeActivity" @tab-click="handleClick">
        <el-tab-pane label="Product List" name="first" class="active">
          <el-form :model="form" class="demo-form-inline" label-width="120px">
            <el-row :gutter="10">
              <el-form-item label="Find Product">
                <el-button
                  type="primary"
                  icon="el-icon-search"
                  @change="handleFilter"
                >{{ $t('table.search') }}</el-button>
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <suggestions
                    ref="countrySuggestions"
                    v-model="searchQuery"
                    :options="searchOptions"
                    :on-input-change="onCountryInputChange"
                  >
                    <div slot="item" slot-scope="props" class="single-item">
                      <strong>Name: {{ props.item }} Code=>{{ props.item }}</strong>
                    </div>
                  </suggestions>
                </el-col>
              </el-form-item>
            </el-row>
          </el-form>
          <el-table
            v-loading="loading"
            :data="list"
            border
            fit
            highlight-current-row
            style="width: 100%;"
          >
            <el-table-column align="center" label="Action" width="100">
              <template slot-scope="scope">
                <span>{{ scope.row.index }}</span>
              </template>
            </el-table-column>
            <el-table-column align="center" label="ID" width="60">
              <template slot-scope="scope">
                <span>{{ scope.row.index }}</span>
              </template>
            </el-table-column>
            <el-table-column align="center" label="Product Code" width="150">
              <template slot-scope="scope">
                <span>{{ scope.row.BrCode }}</span>
              </template>
            </el-table-column>
            <el-table-column align="left" label="Product Name" width="230">
              <template slot-scope="scope">
                <span>{{ scope.row.first_name_eng }} {{ scope.row.family_name_eng }}</span>
              </template>
            </el-table-column>
            <el-table-column align="left" label="QTY" width="80">
              <template slot-scope="scope">
                <span>{{ scope.row.gender }}</span>
              </template>
            </el-table-column>
            <el-table-column align="left" label="Unit" width="100">
              <template slot-scope="scope">
                <span>{{ scope.row.gender }}</span>
              </template>
            </el-table-column>

            <el-table-column align="left" label="Price" width="120">
              <template slot-scope="scope">
                <span>{{ scope.row.project_name_kh }}</span>
              </template>
            </el-table-column>

            <el-table-column align="left" label="Discount (%)" width="130">
              <template slot-scope="scope" style="text-align:right">
                <span>{{ scope.row.project_name_eng }}</span>
              </template>
            </el-table-column>
            <el-table-column align="center" label="Discount ($)" width="125">
              <template slot-scope="scope">
                <span>{{ scope.row.project_start_date }}</span>
              </template>
            </el-table-column>
            <el-table-column align="center" label="Total ($)" width="180">
              <template slot-scope="scope">
                <span>{{ scope.row.project_exp_date }}</span>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <p>
      <el-card>
        <el-tabs v-model="productActivity" @tab-click="handleClick">
          <el-tab-pane label="Product Information" name="first">
            <el-form ref="form" :model="form" :rules="rules" label-width="130px">
              <div class="grid-content bg-purple">
                <el-row :gutter="10">
                  <el-form-item label="Stock Date" prop="StockDate">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-date-picker v-model="form.StockDate" type="date" style="width: 100%;" />
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <div class="grid-content bg-purple-light">
                <el-row :gutter="10">
                  <el-form-item label="Stock Type" prop="StockType">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-select v-model="form.StockType">
                        <el-option
                          v-for="item in StockTypeList"
                          :key="item.look_id"
                          :label="item.full_name_en"
                          :value="item.full_name_en"
                        />
                      </el-select>
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <div class="grid-content bg-purple-light">
                <el-row :gutter="10">
                  <el-form-item label="Deliver by" prop="Deliverby">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-select v-model="form.Deliverby">
                        <el-option
                          v-for="item in DeliveryList"
                          :key="item.id"
                          :label="item.name"
                          :value="item.name"
                        />
                      </el-select>
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <div class="grid-content bg-purple-light">
                <el-row :gutter="10">
                  <el-form-item label="Deliver referent" prop="Deliverreferent">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-input v-model="form.Deliverreferent" />
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <div class="grid-content bg-purple-light">
                <el-row :gutter="10">
                  <el-form-item label="Deliver date" prop="DeliverDate">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-date-picker v-model="form.DeliverDate" type="date" style="width: 100%;" />
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <div class="grid-content bg-purple-light">
                <el-row :gutter="10">
                  <el-form-item label="Arrived date" prop="ArrivedDate" name="ArrivedDate">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-date-picker v-model="form.ArrivedDate" type="date" style="width: 100%;" />
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <div class="grid-content bg-purple-light">
                <el-row :gutter="10">
                  <el-form-item label="Supplier Name" prop="SupplierName">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-input v-model="form.SupplierName" type="text" />
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <div class="grid-content bg-purple-light">
                <el-row :gutter="10">
                  <el-form-item label="Warehousename" prop="Warehousename">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-select v-model="form.Warehousename">
                        <el-option
                          v-for="item in WarehouseList"
                          :key="item.warehouse_code"
                          :label="item.warehouse_name"
                          :value="item.warehouse_name"
                        />
                      </el-select>
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <div class="grid-content bg-purple-light">
                <el-row :gutter="10">
                  <el-form-item label="Reference No" prop="ReferenceNo">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-input v-model="form.ReferenceNo" type="text" />
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <div class="grid-content bg-purple-light">
                <el-row :gutter="10">
                  <el-form-item label="Document" prop="Document">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-input v-model="form.Document" type="file" />
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <div class="grid-content bg-purple-light">
                <el-row :gutter="10">
                  <el-form-item label="Noted" prop="Noted">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-input v-model="form.Noted" type="textarea" />
                    </el-col>
                  </el-form-item>
                </el-row>
              </div>
              <p>
                <el-form-item>
                  <el-button type="primary" @click="onSubmit()">Create</el-button>
                  <el-button @click="resetForm('form')">Reset</el-button>
                </el-form-item>
              </p>
            </el-form>
          </el-tab-pane>
        </el-tabs>
      </el-card>
    </p>
    <!--  From Approve -->
    <el-dialog title="Authorize" :visible.sync="centerDialogVisible" width="30%" left>
      <div class="form-container">
        <el-form ref="loginForm" :model="loginForm" :rules="loginRules">
          <el-form-item label="UserName" :label-width="formLabelWidth" prop="email">
            <el-input
              v-model="loginForm.email"
              type="text"
              name="email"
              placeholder="please input your username"
            />
          </el-form-item>
          <el-form-item label="Password" :label-width="formLabelWidth" prop="password">
            <el-input
              v-model="loginForm.password"
              :type="pwdType"
              name="password"
              placeholder="please input your password"
            />
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="centerDialogVisible = false">{{ $t('table.cancel') }}</el-button>
          <el-button type="primary" @click.native.prevent="handleLogin">{{ $t('table.confirm') }}</el-button>
        </div>
      </div>
    </el-dialog>
    <!--End  From Approve -->
  </div>
</template>
<script>
import Resource from '@/api/resource';
import { validEmail } from '@/utils/validate';
import moment from 'moment';
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directive
import axios from 'axios';
import Suggestions from '../Suggestions/Suggestions';

const ProjectResource = new Resource('Project');
const GetbranchResource = new Resource('GetBranch');
const AuthorizeResource = new Resource('Project/authorized');
const SysModeResource = new Resource('sys_lookup_Mode');
const SysDeliveryByResource = new Resource('sys_DeliveryBy');
const SysWarehouseResource = new Resource('sys_Warehouse');

export default {
  directives: { waves, permission },
  components: { Suggestions },
  data() {
    const validateEmail = (rule, value, callback) => {
      if (!validEmail(value)) {
        callback(new Error('Please enter the correct email'));
      } else {
        callback();
      }
    };
    const validatePass = (rule, value, callback) => {
      if (value.length < 4) {
        callback(new Error('Password cannot be less than 4 digits'));
      } else {
        callback();
      }
    };
    const countries = [
      'Afghanistan',
      'Åland Islands',
      'Albania',
      'Algeria',
      'American Samoa',
      'AndorrA',
      'Angola',
      'Anguilla',
      'Antarctica',
      'Antigua and Barbuda',
      'Argentina',
      'Armenia',
      'Aruba',
      'Australia',
      'Austria',
      'Azerbaijan',
      'Bahamas',
      'Bahrain',
      'Bangladesh',
      'Barbados',
      'Belarus',
      'Belgium',
      'Belize',
      'Benin',
      'Bermuda',
      'Bhutan',
      'Bolivia',
      'Bosnia and Herzegovina',
      'Botswana',
      'Bouvet Island',
      'Brazil',
      'British Indian Ocean Territory',
      'Brunei Darussalam',
      'Bulgaria',
      'Burkina Faso',
      'Burundi',
      'Cambodia',
      'Cameroon',
      'Canada',
      'Cape Verde',
      'Cayman Islands',
      'Central African Republic',
      'Chad',
      'Chile',
      'China',
      'Christmas Island',
      'Cocos (Keeling) Islands',
      'Colombia',
      'Comoros',
      'Congo',
      'Congo, The Democratic Republic of the',
      'Cook Islands',
      'Costa Rica',
      "Cote D'Ivoire",
      'Croatia',
      'Cuba',
      'Cyprus',
      'Czech Republic',
      'Denmark',
      'Djibouti',
      'Dominica',
      'Dominican Republic',
      'Ecuador',
      'Egypt',
      'El Salvador',
      'Equatorial Guinea',
      'Eritrea',
      'Estonia',
      'Ethiopia',
      'Falkland Islands (Malvinas)',
      'Faroe Islands',
      'Fiji',
      'Finland',
      'France',
      'French Guiana',
      'French Polynesia',
      'French Southern Territories',
      'Gabon',
      'Gambia',
      'Georgia',
      'Germany',
      'Ghana',
      'Gibraltar',
      'Greece',
      'Greenland',
      'Grenada',
      'Guadeloupe',
      'Guam',
      'Guatemala',
      'Guernsey',
      'Guinea',
      'Guinea-Bissau',
      'Guyana',
      'Haiti',
      'Heard Island and Mcdonald Islands',
      'Holy See (Vatican City State)',
      'Honduras',
      'Hong Kong',
      'Hungary',
      'Iceland',
      'India',
      'Indonesia',
      'Iran, Islamic Republic Of',
      'Iraq',
      'Ireland',
      'Isle of Man',
      'Israel',
      'Italy',
      'Jamaica',
      'Japan',
      'Jersey',
      'Jordan',
      'Kazakhstan',
      'Kenya',
      'Kiribati',
      "Korea, Democratic People'S Republic of Korea, Republic of Kuwait",
      'Kyrgyzstan',
      "Lao People'S Democratic Republic",
      'Latvia',
      'Lebanon',
      'Lesotho',
      'Liberia',
      'Libyan Arab Jamahiriya',
      'Liechtenstein',
      'Lithuania',
      'Luxembourg',
      'Macao',
      'Macedonia, The Former Yugoslav Republic of',
      'Madagascar',
      'Malawi',
      'Malaysia',
      'Maldives',
      'Mali',
      'Malta',
      'Marshall Islands',
      'Martinique',
      'Mauritania',
      'Mauritius',
      'Mayotte',
      'Mexico',
      'Micronesia, Federated States of',
      'Moldova, Republic of',
      'Monaco',
      'Mongolia',
      'Montserrat',
      'Morocco',
      'Mozambique',
      'Myanmar',
      'Namibia',
      'Nauru',
      'Nepal',
      'Netherlands',
      'Netherlands Antilles',
      'New Caledonia',
      'New Zealand',
      'Nicaragua',
      'Niger',
      'Nigeria',
      'Niue',
      'Norfolk Island',
      'Northern Mariana Islands',
      'Norway',
      'Oman',
      'Pakistan',
      'Palau',
      'Palestinian Territory, Occupied',
      'Panama',
      'Papua New Guinea',
      'Paraguay',
      'Peru',
      'Philippines',
      'Pitcairn',
      'Poland',
      'Portugal',
      'Puerto Rico',
      'Qatar',
      'Reunion',
      'Romania',
      'Russian Federation',
      'RWANDA',
      'Saint Helena',
      'Saint Kitts and Nevis',
      'Saint Lucia',
      'Saint Pierre and Miquelon',
      'Saint Vincent and the Grenadines',
      'Samoa',
      'San Marino',
      'Sao Tome and Principe',
      'Saudi Arabia',
      'Senegal',
      'Serbia and Montenegro',
      'Seychelles',
      'Sierra Leone',
      'Singapore',
      'Slovakia',
      'Slovenia',
      'Solomon Islands',
      'Somalia',
      'South Africa',
      'South Georgia and the South Sandwich Islands',
      'Spain',
      'Sri Lanka',
      'Sudan',
      'Suriname',
      'Svalbard and Jan Mayen',
      'Swaziland',
      'Sweden',
      'Switzerland',
      'Syrian Arab Republic',
      'Taiwan, Province of China',
      'Tajikistan',
      'Tanzania, United Republic of',
      'Thailand',
      'Timor-Leste',
      'Togo',
      'Tokelau',
      'Tonga',
      'Trinidad and Tobago',
      'Tunisia',
      'Turkey',
      'Turkmenistan',
      'Turks and Caicos Islands',
      'Tuvalu',
      'Uganda',
      'Ukraine',
      'United Arab Emirates',
      'United Kingdom',
      'United States',
      'United States Minor Outlying Islands',
      'Uruguay',
      'Uzbekistan',
      'Vanuatu',
      'Venezuela',
      'Viet Nam',
      'Virgin Islands, British',
      'Virgin Islands, U.S.',
      'Wallis and Futuna',
      'Western Sahara',
      'Yemen',
      'Zambia',
      'Zimbabwe',
    ];
    return {
      items: [1, 2, 3, 4, 5],
      searchQuery: '',
      countries: countries,
      selectedCountry: null,
      selectedSearchItem: null,
      options: {},
      searchOptions: {
        placeholder: 'Try seaching "Guardians"',
        debounce: 400,
      },
      activeActivity: 'first',
      productActivity: 'first',
      loginRules: {
        email: [{ required: true, trigger: 'blur', validator: validateEmail }],
        password: [
          { required: true, trigger: 'blur', validator: validatePass },
        ],
      },
      loginForm: {
        email: '',
        password: '',
        Id: '',
      },
      pwdType: 'password',
      redirect: undefined,
      branch: {},
      StockTypeList: {},
      ListBranch: {},
      lists: {},
      listcompany: {},
      DeliveryList: {},
      WarehouseList: {},
      dialogFormVisible: false,
      centerDialogVisible: false,
      downloading: true,
      btnStatus: false,
      list: null,
      total: 0,
      loading: true,
      query: {
        page: 1,
        limit: 15,
        brcode: '',
      },
      form: {
        Id: '',
        name: '',
        BrName: '',
        TrnName: '',
        PrName: '',
        date: '',
        delivery: false,
        type: [],
        resource: '',
        Company_id: '',
        desc: '',
        TrnMode: '',
        amount: '',
        CompanyName: '',
        ccy: '',
      },
      rules: {
        StockDate: [
          {
            required: true,
            message: 'Stock Date is required',
            trigger: 'change',
          },
        ],
        StockType: [
          {
            required: true,
            message: 'Stock Type is required',
            trigger: 'change',
          },
        ],
        Deliverby: [
          {
            required: true,
            message: 'Delivery By is required',
            trigger: 'change',
          },
        ],
        Deliverreferent: [
          {
            required: true,
            message: 'Deliver referent is required',
            trigger: 'blur',
          },
        ],
        DeliverDate: [
          {
            required: true,
            message: 'Deliver Date is required',
            trigger: 'change',
          },
        ],
        ArrivedDate: [
          {
            required: true,
            message: 'Arrived Date is required',
            trigger: 'change',
          },
        ],
        SupplierName: [
          {
            required: true,
            message: 'Supplier Name is required',
            trigger: 'blur',
          },
        ],
        Warehousename: [
          {
            required: true,
            message: 'Warehouse Name is required',
            trigger: 'change',
          },
        ],
        ReferenceNo: [
          {
            required: true,
            message: 'Reference No is required',
            trigger: 'blur',
          },
        ],
      },
      formLabelWidth: '100px',
    };
  },
  created() {
    this.getList();
    this.getBranch();
    this.getStockType();
    this.getDeliveryBy();
    this.getWarehouse();
  },
  methods: {
    async getList() {
      const { limit, page } = this.query;
      this.loading = true;
      const { data } = await ProjectResource.list(this.query);
      this.list = data;
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.loading = false;
    },
    async getStockType() {
      const { data } = await SysModeResource.get('stock_type');
      this.StockTypeList = data;
    },
    async getDeliveryBy() {
      const { data } = await SysDeliveryByResource.list({});
      this.DeliveryList = data;
    },
    async getWarehouse() {
      const { data } = await SysWarehouseResource.list({});
      this.WarehouseList = data;
    },
    async getBranch() {
      this.loading = true;
      const { data } = await GetbranchResource.list();
      this.ListBranch = data;
      this.loading = false;
    },
    handleDelete(row) {
      this.$confirm(`Are you sure you want to delete?`, '', { type: 'warning' })
        .then(() => {
          ProjectResource.destroy(row);
          this.$message({
            message:
              'Customer Project information has been delete successfully',
            type: 'success',
            duration: 5 * 1000,
          });
        })
        .catch(error => {
          console.log(error);
        });
    },
    handleApprove(Id) {
      this.loginForm.project_id = Id;
      this.centerDialogVisible = true;
    },
    handleClick(tab, event) {
      console.log('Switching tab ', tab, event);
    },
    // Event Update data
    handleEdit(scope) {
      this.form = scope.row;
      this.dialogFormVisible = true;
    },
    handleFilter() {
      this.loading = true;
      this.getBranch();
      this.loading = false;
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    onSubmit() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          this.form.datestartproject = this.backEndDateFormat(
            this.form.datestartproject
          );
          this.form.dateendproject = this.backEndDateFormat(
            this.form.dateendproject
          );
          ProjectResource.store(this.form)
            .then(response => {
              this.$message({
                message: 'Project has been created successfully.',
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
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true;
          AuthorizeResource.store(this.loginForm)
            .then(() => {
              this.loading = false;
              this.$message({
                message: 'Approved has  successfully',
                type: 'success',
                duration: 5 * 1000,
              });
              this.centerDialogVisible = false;
              this.getList();
              this.loading = false;
            })
            .catch(() => {
              this.loading = false;
            });
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    handleDownload() {
      import('@/vendor/Export2Excel').then(excel => {
        this.loading = true;
        const tHeader = [
          'id',
          'Product Name',
          'TrnDate',
          'TrnAmt',
          'Company Name',
          'Branch Name',
          'Posted By',
          'Posteddate',
          'Authorized By',
          'status',
        ];
        const filterVal = [
          'index',
          'PrName',
          'TrnDate',
          'TrnAmt',
          'CompanyName',
          'BrName',
          'created_by',
          'Posteddate',
          'authorized_by',
          'smsstatus',
        ];
        const data = this.formatJson(filterVal, this.list);
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: 'Performace Sale-list',
        });
        this.loading = false;
      });
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => v[j]));
    },
    onCountryInputChange(query) {
      if (query.trim().length === 0) {
        return null;
      }
      return this.countries.filter(country => {
        return country.toLowerCase().includes(query.toLowerCase());
      });
    },
    onCountrySelected(item) {
      this.selectedCountry = item;
    },
    onInputChange(query) {
      if (query.trim().length === 0) {
        return null;
      }
      const url = `https://api.duckduckgo.com/?q=${query}&format=json&pretty=1`;
      return new Promise(resolve => {
        axios.get(url).then(response => {
          const items = [];
          response.data.RelatedTopics.forEach(item => {
            if (item.Text) {
              items.push(item);
            } else if (item.Topics && item.Topics.length > 0) {
              item.Topics.forEach(topic => {
                items.push(topic);
              });
            }
          });
          resolve(items);
        });
      });
    },
    onSearchItemSelected(item) {
      this.selectedSearchItem = item;
    },
  },
};
</script>

<style lang="scss" scoped>
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
</style>
