const title = 'Daily Sale List';

const content = `<template>
<div class="app-container">
  <el-table v-loading="loading" :data="list" border fit highlight-current-row style="width: 100%">
    <el-table-column align="center" label="ID" width="70">
      <template slot-scope="scope">
        <span>{{ scope.row.Id }}</span>
      </template>
    </el-table-column>
    <el-table-column align="left" label="Product Name" width="200">
      <template slot-scope="scope">
        <span>{{ scope.row.PrName }}</span>
      </template>
    </el-table-column>

    <el-table-column align="center" label="TrnDate" width="120">
      <template slot-scope="scope">
        <span>{{ scope.row.TrnDate }}</span>
      </template>
    </el-table-column>

    <el-table-column align="center" label="TrnAmt" width="120">
      <template slot-scope="scope">
        <span>{{ scope.row.TrnAmt | numFormat('0,0.00') }}</span>
      </template>
    </el-table-column>

    <el-table-column align="center" label="Company Name" width="250">
      <template slot-scope="scope">
        <span>{{ scope.row.CompanyName }}</span>
      </template>
    </el-table-column>
    <el-table-column align="center" label="Branch Name" width="120">
      <template slot-scope="scope">
        <span>{{ scope.row.BrName }}</span>
      </template>
    </el-table-column>
    <el-table-column align="center" label="Posted By" width="120">
      <template slot-scope="scope">
        <span>{{ scope.row.created_by }}</span>
      </template>
    </el-table-column>
    <el-table-column align="center" label="Posted Date" width="120">
      <template slot-scope="scope">
        <span>{{ scope.row.Posteddate }}</span>
      </template>
    </el-table-column>
    <el-table-column align="center" label="Authorized By" width="120">
      <template slot-scope="scope">
        <span v-if="scope.row.status==1" style="font-style: italic;">{{ scope.row.authorized_by }}</span>
        <span v-if="!scope.row.status==1">{{ scope.row.authorized_by }}</span>
      </template>
    </el-table-column>
    <el-table-column align="center" label="Status" width="120">
      <template slot-scope="scope">
        <span v-if="scope.row.status==1">
          <el-badge value="not yet approve" class="item" />
        </span>
        <span v-else-if="scope.row.status==0">
          <el-badge value="approve" class="item" type="success" />
        </span>
      </template>
    </el-table-column>
  </el-table>
</div>
</template>
`;

const data = {
  title,
  content,
};
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directive

const SaleDailyResource = new Resource('sales');

export default {
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
      loginRules: {
        email: [{ required: true, trigger: 'blur', validator: validateEmail }],
        password: [
          { required: true, trigger: 'blur', validator: validatePass },
        ],
      },
      loginForm: {
        email: 'tuyravey99@gmail.com',
        password: 'laravue',
        companyid: '',
        PlanDate: '',
      },
      pwdType: 'password',
      redirect: undefined,
      branch: {},
      listpro: {},
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
    this.getCompany();
    this.getProduct();
    this.getMode();
  },
  methods: {
    async getList() {
      const { limit, page } = this.query;
      this.loading = true;
      const { data, meta } = await SaleDailyResource.list(this.query);
      this.list = data;
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.total = meta.total;
      this.loading = false;
    },

    // Event search Branch
    handleDownload() {
      import('@/vendor/Export2Excel').then(excel => {
        this.downloading = true;
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
        this.downloading = false;
      });
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => v[j]));
    },
  },
};
