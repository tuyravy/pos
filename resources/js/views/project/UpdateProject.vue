<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="140px">
      <el-card>
        <el-tabs v-model="activeActivity">
          <el-tab-pane label="Update Project Enquiry" name="first" class="active">
            <div class="grid-content bg-purple">
              <el-row :gutter="10">
                <p>
                  <el-form-item :label="$t('project.customer')" prop="customer">
                    <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                      <el-select v-model="form.customer" name="cus_id" disabled="disabled">
                        <el-option
                          v-for="item in customerlist"
                          :key="item.cus_id"
                          :label="item.customer"
                          :value="item.cus_id"
                        >{{ item.first_name_eng }} {{ item.family_name_eng }}</el-option>
                      </el-select>
                    </el-col>
                  </el-form-item>
                </p>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('project.projectnamekh')" prop="project_name_kh">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.project_name_kh" type="text" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('project.projectnameen')" prop="project_name_eng">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.project_name_eng" type="text" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('project.datestartproject')" prop="project_start_date">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-date-picker
                      v-model="form.project_start_date"
                      type="date"
                      style="width: 100%;"
                    />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item
                  :label="$t('project.dateendproject')"
                  prop="project_exp_date"
                  name="project_exp_date"
                >
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-date-picker
                      v-model="form.project_exp_date"
                      type="date"
                      style="width: 100%;"
                    />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('project.gisCode')" prop="gis_code" name="gis_code">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.gis_code" class="el-col el-col-12" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('project.projectaddress')" prop="project_address">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input
                      v-model="form.project_address"
                      type="textarea"
                      class="el-col el-col-12"
                    />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('project.projectnoted')" prop="project_note">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.project_note" type="textarea" class="el-col el-col-12" />
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
      </el-card>
    </el-form>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import moment from 'moment';

const ProjectResource = new Resource('Project');
const CustomerResource = new Resource('customer');
export default {
  data() {
    return {
      activeActivity: 'first',
      form: {
        customer: '',
      },
      customerlist: {},
      rules: {
        customer: [
          {
            required: true,
            message: 'Customer Name is required',
            trigger: 'blur',
          },
        ],
        project_name_kh: [
          {
            required: true,
            message: 'Project Name khmer is required',
            trigger: 'blur',
          },
        ],
        project_name_eng: [
          {
            required: true,
            message: 'Project Name Eng is required',
            trigger: 'blur',
          },
        ],
        project_start_date: [
          {
            required: true,
            message: 'Date start project is required ',
            trigger: 'blur',
          },
        ],
        project_exp_date: [
          {
            required: true,
            message: 'Date end project is required ',
            trigger: 'blur',
          },
        ],
        project_address: [
          {
            required: true,
            message: 'Project address is required ',
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
    const id = this.$route.params && this.$route.params.id;
    this.getList(id);
    this.getCustomerList();
  },
  methods: {
    async getList(id) {
      const { data } = await ProjectResource.get(id);
      this.form = Object.assign({}, data);
    },
    async getCustomerList() {
      const { data } = await CustomerResource.list({});
      this.customerlist = data;
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
          ProjectResource.update(this.form.project_id, this.form)
            .then(response => {
              this.$message({
                message: 'Project has been updated successfully.',
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
