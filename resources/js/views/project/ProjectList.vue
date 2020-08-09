<template>
  <div class="app-container">
    <el-card>
      <el-tabs v-model="activeActivity" @tab-click="handleClick">
        <el-tab-pane :label="$t('filter')" name="first" class="active">
          <el-form :inline="true" :model="form" class="demo-form-inline">
            <el-form-item :label="$t('Branch')">
              <el-select
                v-model="query.brcode"
                clearable
                filterable
                class="filter-item"
                :placeholder="$t('BranchHolder')"
                @change="handleFilter"
              >
                <el-option
                  v-for="item in ListBranch"
                  :key="item.BrCode"
                  :label="item.ShortCode"
                  :value="item.BrCode"
                />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button
                type="primary"
                icon="el-icon-search"
                @change="handleFilter"
              >{{ $t('Button.Search') }}</el-button>
              <el-button
                v-waves
                :loading="loading"
                class="filter-item"
                type="primary"
                icon="el-icon-download"
                @click="handleDownload"
              />
              <template>
                <router-link to="/project/addproject/">
                  <el-button type="success" icon="el-icon-plus">{{ $t('Button.Add') }}</el-button>
                </router-link>
              </template>
            </el-form-item>
          </el-form>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <pre />
    <el-card>
      <el-tabs v-model="activeActivity">
        <el-tab-pane :label="$t('ProjectInfo')" name="first" class="active">
          <el-table
            v-loading="loading"
            :data="list"
            border
            fit
            highlight-current-row
            style="width: 100%"
          >
            <el-table-column align="center" :label="$t('table.Actions')" width="180">
              <template slot-scope="scope">
                <router-link :to="'/project/UpdateProject/edit/' + scope.row.project_id">
                  <el-button type="primary" size="mini" icon="el-icon-edit" />
                </router-link>
                <el-button
                  v-if="scope.row.status == 1"
                  size="mini"
                  type="success"
                  icon="el-icon-check"
                  @click="handleApprove(scope.row.project_id)"
                />
                <el-button
                  v-if="scope.row.status == 0"
                  :disabled="true"
                  size="mini"
                  type="success"
                  icon="el-icon-check"
                  @click="handleApprove(scope.row.project_id)"
                />
                <el-button
                  v-if="scope.row.status == 1"
                  size="mini"
                  type="danger"
                  icon="el-icon-delete"
                  @click="handleDelete(scope.row.project_id)"
                />
                <el-button
                  v-if="scope.row.status == 0"
                  :disabled="true"
                  size="mini"
                  type="danger"
                  icon="el-icon-delete"
                  @click="handleDelete(scope.row.project_id)"
                />
              </template>
            </el-table-column>
            <el-table-column align="center" :label="$t('table.Id')" width="100">
              <template slot-scope="scope">
                <span>{{ scope.row.index }}</span>
              </template>
            </el-table-column>
            <!-- <el-table-column align="center" label="BrCode" width="80">
              <template slot-scope="scope">
                <span>{{ scope.row.BrCode }}</span>
              </template>
            </el-table-column> -->
            <el-table-column align="center" :label="$t('table.BrName')" width="120">
              <template slot-scope="scope">
                <span>{{ scope.row.BrName }}</span>
              </template>
            </el-table-column>
            <el-table-column align="left" :label="$t('table.Customer')" width="160">
              <template slot-scope="scope">
                <span>{{ scope.row.first_name_eng }} {{ scope.row.family_name_eng }}</span>
              </template>
            </el-table-column>
            <el-table-column align="left" :label="$t('table.Gender')" width="80">
              <template slot-scope="scope">
                <span>{{ scope.row.gender }}</span>
              </template>
            </el-table-column>
            <el-table-column align="left" :label="$t('table.ProjectName')" width="150">
              <template slot-scope="scope" style="text-align:right">
                <span>{{ scope.row.project_name_eng }}</span>
              </template>
            </el-table-column>
            <el-table-column align="center" :label="$t('table.ProjectStart')" width="120">
              <template slot-scope="scope">
                <span>{{ scope.row.project_start_date }}</span>
              </template>
            </el-table-column>
            <el-table-column align="center" :label="$t('table.ProjectEnd')" width="120">
              <template slot-scope="scope">
                <span>{{ scope.row.project_exp_date }}</span>
              </template>
            </el-table-column>
            <el-table-column align="center" :label="$t('table.status')" width="110">
              <template slot-scope="scope">
                <span v-if="scope.row.status == 1">
                  <el-badge value="not yet approve" class="item" />
                </span>
                <span v-else-if="scope.row.status == 0">
                  <el-badge value="approve" class="item" type="success" />
                </span>
              </template>
            </el-table-column>
          </el-table>
          <pagination
            v-show="total > 0"
            :total="total"
            :page.sync="query.page"
            :limit.sync="query.limit"
            @pagination="getList"
          />
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
                <el-button
                  type="primary"
                  @click.native.prevent="handleLogin"
                >{{ $t('table.confirm') }}</el-button>
              </div>
            </div>
          </el-dialog>
          <!--End  From Approve -->
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>
<script>
import Pagination from '@/components/Pagination'; // Secondary package based on el-pagination
import Resource from '@/api/resource';
import { validEmail } from '@/utils/validate';
import moment from 'moment';
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directive

const ProjectResource = new Resource('Project');
const GetbranchResource = new Resource('GetBranch');
const AuthorizeResource = new Resource('Project/authorized');

export default {
  components: { Pagination },
  directives: { waves, permission },
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

    return {
      activeActivity: 'first',
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
      ListBranch: {},
      lists: {},
      listcompany: {},
      dialogFormVisible: false,
      centerDialogVisible: false,
      downloading: true,
      btnStatus: false,
      list: null,
      total: 0,
      rules: {},
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
      formLabelWidth: '100px',
    };
  },
  created() {
    this.getList();
    this.getBranch();
  },
  methods: {
    async getList() {
      const { limit, page } = this.query;
      this.loading = true;
      const { data, meta } = await ProjectResource.list(this.query);
      this.list = data;
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.total = meta.total;
      this.loading = false;
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
          this.getList();
          this.loading = false;
        })
        .catch(error => {
          console.log(error);
        });
    },
    handleApprove(Id) {
      this.loginForm.project_id = Id;
      this.centerDialogVisible = true;
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
          'ID',
          'BrCode',
          'First name_eng',
          'Family name_eng',
          'Gender',
          'Company name',
          'Project Name(Kh)',
          'Project Name(Eng)',
          'Project Start',
          'Project End',
          'created_by',
          'created_at',
          'Authorized By',
          'Authorized date',
          'Updated by',
          'status',
        ];
        const filterVal = [
          'index',
          'BrCode',
          'first_name_eng',
          'family_name_eng',
          'gender',
          'company_name',
          'project_name_kh',
          'project_name_eng',
          'project_start_date',
          'project_exp_date',
          'created_by',
          'created_at',
          'authorized_by',
          'authorized_date',
          'updated_by',
          'status',
        ];
        const data = this.formatJson(filterVal, this.list);
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: 'Project List',
        });
        this.loading = false;
      });
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => v[j]));
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
