<template>
  <div class="app-container">

    <el-form ref="form" :model="sizeForm" label-width="120px" size="mini">
      <el-form-item label="Activity name">
        <el-input v-model="sizeForm.name" />
      </el-form-item>
      <el-form-item label="Activity zone">
        <el-select v-model="sizeForm.region" placeholder="please select your zone">
          <el-option label="Zone one" value="shanghai" />
          <el-option label="Zone two" value="beijing" />
        </el-select>
      </el-form-item>
      <el-form-item label="Activity time">
        <el-col :span="11">
          <el-date-picker v-model="sizeForm.date1" type="date" placeholder="Pick a date" style="width: 100%;" />
        </el-col>
        <el-col class="line" :span="2">-</el-col>
        <el-col :span="11">
          <el-time-picker v-model="sizeForm.date2" placeholder="Pick a time" style="width: 100%;" />
        </el-col>
      </el-form-item>
      <el-form-item label="Activity type">
        <el-checkbox-group v-model="sizeForm.type">
          <el-checkbox-button label="Online activities" name="type" />
          <el-checkbox-button label="Promotion activities" name="type" />
        </el-checkbox-group>
      </el-form-item>
      <el-form-item label="Resources">
        <el-radio-group v-model="sizeForm.resource" size="medium">
          <el-radio border label="Sponsor" />
          <el-radio border label="Venue" />
        </el-radio-group>
      </el-form-item>
      <el-form-item size="large">
        <el-button type="primary" @click="onSubmit">Create</el-button>
        <el-button>Cancel</el-button>
      </el-form-item>
    </el-form>

    <!-- Table -->
    <el-button type="text" @click="dialogTableVisible = true">open a Table nested Dialog</el-button>
    <el-dialog title="Shipping address" :visible.sync="dialogTableVisible">
      <el-table :data="gridData">
        <el-table-column property="date" label="Date" width="150" />
        <el-table-column property="name" label="Name" width="200" />
        <el-table-column property="address" label="Address" />
      </el-table>
    </el-dialog>

    <!-- Form -->
    <el-button type="text" @click="dialogFormVisible = true">open a Form nested Dialog</el-button>

    <el-dialog title="Shipping address" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="Promotion name" :label-width="formLabelWidth">
          <el-input v-model="form.name" autocomplete="off" />
        </el-form-item>
        <el-form-item label="Zones" :label-width="formLabelWidth">
          <el-select v-model="form.region" placeholder="Please select a zone">
            <el-option label="Zone No.1" value="shanghai" />
            <el-option label="Zone No.2" value="beijing" />
          </el-select>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="dialogFormVisible = false">Confirm</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
export default {
  data() {
    return {
      gridData: [
        {
          date: '2016-05-02',
          name: 'John Smith',
          address: 'No.1518,  Jinshajiang Road, Putuo District',
        },
        {
          date: '2016-05-04',
          name: 'John Smith',
          address: 'No.1518,  Jinshajiang Road, Putuo District',
        },
        {
          date: '2016-05-01',
          name: 'John Smith',
          address: 'No.1518,  Jinshajiang Road, Putuo District',
        },
        {
          date: '2016-05-03',
          name: 'John Smith',
          address: 'No.1518,  Jinshajiang Road, Putuo District',
        },
      ],
      dialogTableVisible: false,
      dialogFormVisible: false,
      form: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: '',
      },
      formLabelWidth: '120px',
      sizeForm: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: '',
      },
    };
  },
};
</script>
