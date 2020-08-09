<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="120px">
      <el-card>
        <el-tabs v-model="activeActivity">
          <el-tab-pane label="Customer Enquiry" name="first" class="active">
            <div class="grid-content bg-purple">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.familyNameKH')" prop="fristnamekh">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.fristnamekh" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.fristNameKH')" prop="lastnamekh">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.lastnamekh" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.familyNameEng')" prop="fristnameeng">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.fristnameeng" class="el-col el-col-12" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.fristNameEng')" prop="lastnameeng">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.lastnameeng" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.gender')" prop="gender" name="gender">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-select v-model="form.gender">
                      <el-option
                        v-for="item in Genderlist"
                        :key="item.look_id"
                        :label="item.short_name"
                        :value="item.short_name"
                      />
                    </el-select>
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item
                  :label="$t('customer.marristatus')"
                  prop="marristatus"
                  name="marristatus"
                >
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-select v-model="form.marristatus">
                      <el-option
                        v-for="item in Maritallist"
                        :key="item.look_id"
                        :label="item.short_name"
                        :value="item.short_name"
                      />
                    </el-select>
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.dateofbrith')" prop="dateofbrith">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-date-picker v-model="form.dateofbrith" type="date" style="width: 100%;" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item
                  :label="$t('customer.cus_anniversary_date')"
                  prop="cus_anniversary_date"
                >
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-date-picker
                      v-model="form.cus_anniversary_date"
                      type="date"
                      style="width: 100%;"
                    />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.identify_type')" prop="Identify_type">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-select v-model="form.Identify_type">
                      <el-option
                        v-for="item in Identify_type"
                        :key="item.look_id"
                        :label="item.full_name_en"
                        :value="item.look_id"
                      />
                    </el-select>
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.identifynumber')" prop="identifynumber">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.identifynumber" type="number" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item
                  :label="$t('customer.identify_expire_date')"
                  prop="identify_expire_date"
                >
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-date-picker
                      v-model="form.identify_expire_date"
                      type="date"
                      style="width: 100%;"
                    />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.position')" prop="position">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-select v-model="form.position">
                      <el-option
                        v-for="item in Positionlist"
                        :key="item.look_id"
                        :label="item.full_name_en"
                        :value="item.full_name_en"
                      />
                    </el-select>
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
          </el-tab-pane>
        </el-tabs>
      </el-card>
      <pre />
      <el-tabs v-model="tabIndex" type="border-card">
        <el-tab-pane id="tab-0" label="Addresss Info">
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.house_no')" prop="house_no">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.house_no" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.group_no')" prop="group_no">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.group_no" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.street_no')" prop="street_no">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.street_no" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.province')" prop="ProCode">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-select v-model="form.ProCode" filterable @change="handleFitterDistrictlist">
                    <el-option
                      v-for="item in provincelist"
                      :key="item.code"
                      :label="item.name"
                      :value="item.code"
                    />
                  </el-select>
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.district')" prop="decode">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-select v-model="form.decode" filterable @change="handleFitterCommunelist">
                    <el-option
                      v-for="item in districtlist"
                      :key="item.code"
                      :label="item.name"
                      :value="item.code"
                    />
                  </el-select>
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.commune')" prop="ccode">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-select v-model="form.ccode" filterable @change="handleFitterVillage">
                    <el-option
                      v-for="item in communelist"
                      :key="item.code"
                      :label="item.name"
                      :value="item.code"
                    />
                  </el-select>
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.village')" prop="vcode">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-select v-model="form.vcode" filterable>
                    <el-option
                      v-for="item in villagelist"
                      :key="item.code"
                      :label="item.name"
                      :value="item.code"
                    />
                  </el-select>
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.address')" prop="Address">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.address" type="textarea" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.email')" prop="email">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.email" type="email" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.phone')" prop="phone">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.phone" type="number" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.gisCode')" prop="gisCode">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.gisCode" type="text" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.companyname')" prop="companyname">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.companyname" type="text" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.workphone')" prop="workphone">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.workphone" type="text" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.companyemail')" prop="companyemail">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.companyemail" type="number" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.social_type')" prop="social_type">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-select v-model="form.social_type" filterable>
                    <el-option
                      v-for="item in Social_typelist"
                      :key="item.look_id"
                      :label="item.full_name_en"
                      :value="item.look_id"
                    />
                  </el-select>
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.socialcontact')" prop="socialcontact">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.socialcontact" type="text" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item
                :label="$t('customer.company_contact_detail')"
                prop="company_contact_detail"
              >
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.company_contact_detail" type="textarea" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.photo')" prop="photo">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.amount" type="file" name="durationInput" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.cus_other_note')" prop="cus_other_note">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.amount" type="textarea" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.cus_attach_file1')" prop="cus_attach_file1">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.amount" type="file" name="durationInput" />
                </el-col>
              </el-form-item>
              <!-- <el-button type="primary" plain>Next</el-button> -->
            </el-row>
          </div>
        </el-tab-pane>
        <el-tab-pane id="tab-1" label="Other Info">
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.bankaccount')" prop="bankaccount">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.bankaccount" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.backaccountnumber')" prop="backaccountnumber">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.backaccountnumber" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.creditlimit')" prop="creditlimit">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.creditlimit" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.dayslimit')" prop="dayslimit">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.dayslimit" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.ccy')" prop="ccy">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-select v-model="form.ccy">
                    <el-option
                      v-for="item in ccylist"
                      :key="item.look_id"
                      :label="item.short_name"
                      :value="item.short_name"
                    />
                  </el-select>
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
        </el-tab-pane>
      </el-tabs>
    </el-form>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import moment from 'moment';

const SysModeResource = new Resource('sys_lookup_Mode');
const SysProvince = new Resource('sys_getProvince');
const Syslocation = new Resource('sys_getLocation');
const CustomerResource = new Resource('customer');

export default {
  data() {
    return {
      activeActivity: 'first',
      tabIndex: 0,
      list: {},
      Genderlist: {},
      Maritallist: {},
      Identify_type: {},
      Positionlist: {},
      provincelist: {},
      districtlist: {},
      communelist: {},
      villagelist: {},
      listcompany: {},
      ccylist: {},
      Social_typelist: {},
      Companyfilter: true,
      trnmodeloading: true,
      form: {
        TrnName: '',
        ProCode: '',
        decode: '',
        ccode: '',
        vcode: '',
        fristnamekh: '',
        lastnamekh: '',
        fristnameeng: '',
        lastnameeng: '',
        gender: '',
        marristatus: '',
        dateofbrith: '',
        Identify_type: '',
        identifynumber: '',
        identify_expire_date: '',
        house_no: '',
        group_no: '',
        street_no: '',
        position: '',
        CompanyId: '',
        phone: '',
      },
      rules: {
        fristnamekh: [
          {
            required: true,
            message: 'Frist Name khmer is required',
            trigger: 'blur',
          },
        ],
        lastnamekh: [
          {
            required: true,
            message: 'Last Name khmer',
            trigger: 'blur',
          },
        ],
        fristnameeng: [
          {
            required: true,
            message: 'Frist Name Eng is required',
            trigger: 'blur',
          },
        ],
        lastnameeng: [
          {
            required: true,
            message: 'Last Name Eng is required ',
            trigger: 'blur',
          },
        ],
        gender: [
          {
            required: true,
            message: 'Please select gender ',
            trigger: 'change',
          },
        ],
        marristatus: [
          {
            required: true,
            message: 'Please select marristatus ',
            trigger: 'change',
          },
        ],
        Identify_type: [
          {
            required: true,
            message: 'Please select Identify_type ',
            trigger: 'change',
          },
        ],
        dateofbrith: [
          {
            required: true,
            message: 'Please select date of brith ',
            trigger: 'change',
          },
        ],
        cus_anniversary_date: [
          {
            required: true,
            message: 'Please select date of anniversary ',
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
        identify_expire_date: [
          {
            required: true,
            message: 'Please select identify_expire_date is required',
            trigger: 'change',
          },
        ],
        identifynumber: [
          {
            required: true,
            message: 'Identifynumber is required',
            trigger: 'blur',
          },
        ],
        phone: [
          {
            required: true,
            message: 'phone is required',
            trigger: 'blur',
          },
        ],
        position: [
          {
            required: true,
            message: 'Please select position',
            trigger: 'change',
          },
        ],
        ProCode: [
          {
            required: true,
            message: 'Please select province',
            trigger: 'change',
          },
        ],
        decode: [
          {
            required: true,
            message: 'Please select district',
            trigger: 'change',
          },
        ],
        ccode: [
          {
            required: true,
            message: 'Please select commune',
            trigger: 'change',
          },
        ],
        vcode: [
          {
            required: true,
            message: 'Please select village',
            trigger: 'change',
          },
        ],
        ccy: [
          {
            required: true,
            message: 'Please select ccy',
            trigger: 'change',
          },
        ],
      },
    };
  },
  created() {
    this.getMode();
    this.GetMarital();
    this.getIdentify_type();
    this.getPosition();
    this.getProvince();
    this.getSocial_type();
    this.getCcy();
  },
  methods: {
    async getMode() {
      this.trnmodeloading = true;
      const { data } = await SysModeResource.get('gender');
      this.Genderlist = data;
    },
    async GetMarital() {
      const { data } = await SysModeResource.get('marital_st');
      this.Maritallist = data;
    },
    async getIdentify_type() {
      const { data } = await SysModeResource.get('identify_type');
      this.Identify_type = data;
    },
    async getPosition() {
      const { data } = await SysModeResource.get('position');
      this.Positionlist = data;
    },
    async getSocial_type() {
      const { data } = await SysModeResource.get('social_type');
      this.Social_typelist = data;
    },
    async getProvince() {
      const { data } = await SysProvince.list({});
      this.provincelist = data;
    },
    async getDistrictlist() {
      const { data } = await Syslocation.get(this.form.ProCode);
      this.districtlist = data;
    },
    async getCommunelist() {
      const { data } = await Syslocation.get(this.form.decode);
      this.communelist = data;
    },
    async getVillage() {
      const { data } = await Syslocation.get(this.form.ccode);
      this.villagelist = data;
    },
    async getCcy() {
      const { data } = await SysModeResource.get('ccy');
      this.ccylist = data;
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    handleFitterDistrictlist() {
      this.decode.resetFields();
      this.ccode.resetFields();
      this.vcode.resetFields();
      this.getDistrictlist();
    },
    handleFitterCommunelist() {
      this.getCommunelist();
    },
    handleFitterVillage() {
      this.getVillage();
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
          this.form.dateofbrith = this.backEndDateFormat(this.form.dateofbrith);
          this.form.identify_expire_date = this.backEndDateFormat(
            this.form.identify_expire_date
          );
          CustomerResource.store(this.form)
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
fieldset.scheduler-border {
  border: 1pt groove #ffff !important;
  padding: 0 1em 1em 1em !important;
  margin: 0 0 1.5em 0 !important;
  color: #73879c !important;
  -webkit-box-shadow: 0px 0px 0px 0px #000 !important;
  box-shadow: 0px 0px 0px 0px #000 !important;
}

legend.scheduler-border {
  font-size: 1.2em !important;
  font-weight: bold !important;
  text-align: left !important;
  color: #73879c !important;
}
legend {
  font-size: 1em !important;
  color: #777;
}
fieldset {
  width: 100% !important;
}
</style>
