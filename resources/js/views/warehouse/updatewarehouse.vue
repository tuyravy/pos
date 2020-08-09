<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="140px">
      <el-card>
        <el-tabs v-model="activeActivity">
          <el-tab-pane label="Warehouse Enquiry" name="first" class="active">
            <div class="grid-content bg-purple">
              <el-row :gutter="10">
                <el-form-item :label="$t('warehouse.BranchName')" prop="ShortCode">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-select v-model="form.ShortCode" name="BrCode" filterable>
                      <el-option
                        v-for="item in BranchList"
                        :key="item.BrCode"
                        :label="item.ShortCode"
                        :value="item.BrCode"
                      />
                    </el-select>
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('warehouse.warehouse_name')" prop="warehouse_name">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.warehouse_name" />
                  </el-col>
                </el-form-item>
              </el-row>
            </div>
            <div class="grid-content bg-purple-light">
              <el-row :gutter="10">
                <el-form-item :label="$t('warehouse.warehouse_note')" prop="warehouse_note">
                  <el-col :xs="24" :sm="6" :md="8" :lg="9" :xl="11">
                    <el-input v-model="form.warehouse_note" class="el-col el-col-12" />
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

const BranchResource = new Resource('GetBranch');
const WarehouseResource = new Resource('warehouse');
export default {
  data() {
    return {
      activeActivity: 'first',
      BranchList: {},
      form: {
        BranchName: '',
        warehouse_name: '',
        warehouse_note: '',
        BrCode: '',
      },
      rules: {
        ShortCode: [
          {
            required: true,
            message: 'Branch Name is required',
            trigger: 'change',
          },
        ],
        warehouse_name: [
          {
            required: true,
            message: 'Warehouse Name is required',
            trigger: 'blur',
          },
        ],
        warehouse_note: [
          {
            required: true,
            message: 'Warehouse Note is required',
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
    this.getBranchList();
  },
  methods: {
    async getList(id) {
      const { data } = await WarehouseResource.get(id);
      this.form = Object.assign({}, data);
    },
    async getBranchList() {
      const { data } = await BranchResource.list({});
      this.BranchList = data;
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    onSubmit() {
      console.log(this.form);
      this.$refs['form'].validate(valid => {
        if (valid) {
          this.form.datestartproject = this.backEndDateFormat(
            this.form.datestartproject
          );
          this.form.dateendproject = this.backEndDateFormat(
            this.form.dateendproject
          );
          WarehouseResource.update(this.form.warehouse_id, this.form)
            .then(response => {
              this.$message({
                message: 'Warehouse has been created successfully.',
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
