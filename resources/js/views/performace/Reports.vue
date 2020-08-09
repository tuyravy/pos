<template>
  <div class="app-container">
    <el-form :inline="true" :model="query" class="demo-form-inline">
      <el-form-item label="Sale Date">
        <el-date-picker v-model="query.Saledate" type="date" placeholder="Sale date" />
      </el-form-item>
      <el-form-item label="Company">
        <el-select
          v-model="query.CompanyCode"
          v-loading="Companyfilter"
          placeholder="Please select your company"
          @change="handleFilter"
        >
          <el-option
            v-for="item in list"
            :key="item.Company_id"
            :label="item.company_name_en"
            :value="item.CompanyCode"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="Branch">
        <el-select v-model="query.BrName" placeholder="Please select your branch">
          <el-option
            v-for="item in branch"
            :key="item.BrCode"
            :label="item.BrName"
            :value="item.BrName"
          />
        </el-select>
      </el-form-item>
      <!-- <el-form-item>
        <el-button type="primary" @click="onSubmit">Query</el-button>
      </el-form-item>-->
      <el-button
        v-waves
        :loading="downloading"
        class="filter-item"
        type="primary"
        icon="el-icon-download"
        @click="handleDownload"
      >{{ $t('table.export') }}</el-button>
    </el-form>
    <el-table
      v-loading="loading"
      :data="listreport"
      :row-class-name="tableRowClassName"
      borde
      fit
      highlight-current-row
      style="width: 100%"
    >
      <el-table-column fixed prop="date" label="Products" width="420">
        <template slot-scope="scope">
          <span v-if="scope.row.fields_type==1" style="font-weight:bold">{{ scope.row.title }}</span>
          <span
            v-if="scope.row.fields_type==2"
            style="font-weight:bold;margin-left:15px"
          >{{ scope.row.title }}</span>
          <span v-if="scope.row.fields_type==3" style="margin-left:30px">{{ scope.row.title }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="name" label="Monthly Targets" width="150">
        <template slot-scope="scope">
          <span
            v-if="scope.row.fields_type==3"
            style="margin-left:30px"
          >{{ scope.row.plan_values | numFormat('0,0.00') }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="name" label="Result Previous Month" width="180">
        <template slot-scope="scope">
          <span
            v-if="scope.row.fields_type==3"
            style="margin-left:30px"
          >{{ scope.row.result_previous_month | numFormat('0,0.00') }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="name" label="Result in Day" width="150">
        <template slot-scope="scope">
          <span
            v-if="scope.row.fields_type==3"
            style="margin-left:30px"
          >{{ scope.row.result_value | numFormat('0,0.00') }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="name" label="Result in Month" width="150">
        <template slot-scope="scope">
          <span
            v-if="scope.row.fields_type==3"
            style="margin-left:30px"
          >{{ scope.row.result_month | numFormat('0,0.00') }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="zip" label="Compare Last Month(-/+)" width="200">
        <template slot-scope="scope">
          <span
            v-if="scope.row.fields_type==3"
            style="margin-left:30px"
          >{{ scope.row.result_month-scope.row.result_previous_month | numFormat('0,0.00') }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="zip" label="Amt Comparison with Monthly Plan" width="260">
        <template slot-scope="scope">
          <span
            v-if="scope.row.fields_type==3"
            style="margin-left:30px"
          >{{ scope.row.result_month-scope.row.plan_values | numFormat('0,0.00') }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="zip" label="% Monthly Achievement" width="200">
        <template slot-scope="scope">
          <span
            v-if="scope.row.fields_type==3"
            style="margin-left:30px"
          >{{ scope.row.result_month/scope.row.plan_values | numFormat('0,0.00') }}%</span>
        </template>
      </el-table-column>
      <el-table-column label="% Achieved Estimation" width="200">
        <template slot-scope="scope">
          <span
            v-if="scope.row.fields_type==3"
            style="margin-left:30px"
          >{{ 100-(scope.row.result_month/scope.row.plan_values) | numFormat('0,0.00') }}%</span>
        </template>
      </el-table-column>
      <el-table-column label="Annual Plan" width="200">
        <template slot-scope="scope">
          <span
            v-if="scope.row.fields_type==3"
            style="margin-left:30px"
          >{{ scope.row.plan_yearly_values | numFormat('0,0.00') }}</span>
        </template>
      </el-table-column>
      <el-table-column fixed="right" label="% Annual Achievement" width="200">
        <template slot-scope="scope">
          <span
            v-if="scope.row.fields_type==3"
            style="margin-left:30px"
          >{{ scope.row.result_month/scope.row.plan_yearly_values | numFormat('0,0.00') }}%</span>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import Resource from '@/api/resource';
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directive
import moment from 'moment';
const CompanyResource = new Resource('company');
const ComobranchResource = new Resource('CompanyToBranch');
const ReportResources = new Resource('report');

export default {
  directives: { waves, permission },
  data() {
    return {
      listreport: null,
      branch: {},
      list: {},
      rules: {},
      loading: true,
      downloading: false,
      query: {
        page: 1,
        limit: 15,
        CompanyCode: '',
        Saledate: '',
        BrName: '',
      },
      Companyfilter: true,
    };
  },
  created() {
    this.getList();
    this.getCompanyToBranch();
    this.getallReport();
  },
  methods: {
    // get data company
    async getList() {
      const { data } = await CompanyResource.list({});
      this.list = data;
    },
    tableRowClassName(scope) {
      if (scope.row.fields_type === 1) {
        return 'warning-row';
      } else if (scope.row.fields_type === 2) {
        return 'success-row';
      }
      return '';
    },
    // get data company filter branch
    async getCompanyToBranch() {
      this.Companyfilter = true;
      const { limit, page } = this.query;
      const { data } = await ComobranchResource.list(this.query);
      this.branch = data;
      this.branch.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.Companyfilter = false;
      this.resetchange();
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    // get data reports
    async getallReport() {
      this.query.Saledate = this.backEndDateFormat(this.query.Saledate);
      const { limit, page } = this.query;
      this.loading = true;
      const { data } = await ReportResources.list(this.query);
      this.listreport = data;
      this.listreport.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.loading = false;
    },
    resetchange() {
      this.query = {
        BrName: '',
      };
    },
    handleDownload() {
      this.downloading = true;
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = [
          'Products',
          'Monthly Targets',
          'Result Previous Month',
          'Result in Day',
          'Result in Month',
          'Compare Last Month(-/+)',
          'Amt Comparison with Monthly Plan',
          '% Monthly Achievement',
          '% Achieved Estimation',
          'Annual Plan',
          'A% Annual Achievement',
        ];
        const filterVal = [
          'title',
          'plan_values',
          'result_value',
          'result_month',
          'result_previous_month',
        ];
        const data = this.formatJson(filterVal, this.list);
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: 'report-list',
        });
        this.downloading = false;
      });
    },
    handleClick() {
      console.log('click');
    },
    onSubmit() {
      console.log('submit!');
    },
    handleFilter() {
      this.Companyfilter = true;
      this.query.page = 1;
      this.getCompanyToBranch();
      this.getallReport();
      this.Companyfilter = false;
    },
    arraySpanMethod({ row, column, rowIndex, columnIndex }) {
      if (rowIndex === 0) {
        if (columnIndex === 0) {
          return [1, 11];
        } else if (columnIndex === 1) {
          return [0, 0];
        }
      }
    },
    objectSpanMethod({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 0) {
        if (rowIndex % 2 === 0) {
          return {
            rowspan: 2,
            colspan: 1,
          };
        } else {
          return {
            rowspan: 0,
            colspan: 0,
          };
        }
      }
    },
  },
};
</script>

<style>
.el-table th {
  background: #1e9fda;
  color: white;
  pointer-events: none;
}
.el-table .warning-row {
  background: #f5f5f5;
  color: #333;
  pointer-events: none;
}

.el-table .success-row {
  background: #f5f5f5;
  color: #333;
  pointer-events: none;
}
</style>
