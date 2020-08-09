<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="150px">
      <el-card>
        <el-tabs v-model="activeActivity">
          <el-tab-pane label="Customer Enquiry" name="first" class="active">
            <div class="grid-content bg-purple">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.familyNameKH')" prop="family_name_kh">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.family_name_kh" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.fristNameKH')" prop="first_name_kh">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.first_name_kh" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.familyNameEng')" prop="family_name_eng">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.family_name_eng" class="el-col el-col-12" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('customer.fristNameEng')" prop="first_name_eng">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.first_name_eng" />
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
                  prop="marital_status"
                  name="marital_status"
                >
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-select v-model="form.marital_status">
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
                <el-form-item :label="$t('customer.dateofbrith')" prop="birth_date">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-date-picker v-model="form.birth_date" type="date" style="width: 100%;" />
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
                <el-form-item :label="$t('customer.identify_type')" prop="identify_type_1">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-select v-model="form.identify_type_1">
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
                <el-form-item :label="$t('customer.identifynumber')" prop="identity_number_1">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.identity_number_1" type="number" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item
                  :label="$t('customer.identify_expire_date')"
                  prop="identify_expire_date_1"
                >
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-date-picker
                      v-model="form.identify_expire_date_1"
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
                  <el-select v-model="form.vcode" name="code" filterable>
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
              <el-form-item :label="$t('customer.address')" prop="address_detail">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.address_detail" type="textarea" />
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
                  <el-input v-model="form.gis_code" type="text" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.companyname')" prop="company_name">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.company_name" type="text" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.workphone')" prop="work_phone">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.work_phone" type="text" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.companyemail')" prop="company_email">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.company_email" type="email" />
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
              <el-form-item :label="$t('customer.socialcontact')" prop="social_contact">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.social_contact" type="text" />
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
                  <el-input v-model="form.cus_other_note" type="textarea" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.cus_attach_file1')" prop="cus_attach_file1">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.cus_attach_file1" type="file" />
                </el-col>
              </el-form-item>
              <!-- <el-button type="primary" plain>Next</el-button> -->
            </el-row>
          </div>
        </el-tab-pane>
        <el-tab-pane id="tab-1" label="Other Info">
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.bankaccount')" prop="bank_account">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.bank_account" />
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
              <el-form-item :label="$t('customer.creditlimit')" prop="credit_limit">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.credit_limit" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.dayslimit')" prop="days_limit">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-input v-model="form.days_limit" />
                </el-col>
              </el-form-item>
            </el-row>
          </div>
          <div class="grid-content bg-purple-light">
            <el-row :gutter="10">
              <el-form-item :label="$t('customer.ccy')" prop="ccy">
                <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                  <el-select v-model="form.ccy" name="ccy">
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
              <el-button type="primary" @click="onSubmit()">Update</el-button>
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
        first_name_kh: '',
        family_name_kh: '',
        first_name_eng: '',
        family_name_eng: '',
        gender: '',
        marital_status: '',
        birth_date: '',
        identify_type_1: '',
        identity_number_1: '',
        identify_expire_date_1: '',
        cus_anniversary_date: '',
        house_no: '',
        group_no: '',
        street_no: '',
        position: '',
        CompanyId: '',
        Address_detail: '',
        phone: '',
      },
      rules: {
        first_name_kh: [
          {
            required: true,
            message: 'Frist Name khmer is required',
            trigger: 'blur',
          },
        ],
        family_name_kh: [
          {
            required: true,
            message: 'Last Name khmer',
            trigger: 'blur',
          },
        ],
        first_name_eng: [
          {
            required: true,
            message: 'Frist Name Eng is required',
            trigger: 'blur',
          },
        ],
        family_name_eng: [
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
        identify_type_1: [
          {
            required: true,
            message: 'Please select Identify_type ',
            trigger: 'change',
          },
        ],
        birth_date: [
          {
            required: true,
            message: 'Please select date of brith ',
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
        identify_expire_date_1: [
          {
            required: true,
            message: 'Please select identify_expire_date is required',
            trigger: 'change',
          },
        ],
        identity_number_1: [
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
    const id = this.$route.params && this.$route.params.id;
    this.getList(id);
    this.getMode();
    this.GetMarital();
    this.getIdentify_type();
    this.getPosition();
    this.getProvince();
    this.getSocial_type();
    this.getCcy();
  },
  methods: {
    async getList(id) {
      const { data } = await CustomerResource.get(id);
      this.form = Object.assign({}, data);
    },
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
          this.form.birth_date = this.backEndDateFormat(this.form.birth_date);
          this.form.identify_expire_date = this.backEndDateFormat(
            this.form.identify_expire_date_1
          );
          CustomerResource.update(this.form.cus_id, this.form)
            .then(response => {
              this.$message({
                message: 'Customer has been updated successfully.',
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
