<template>
  <el-autocomplete
    v-model="state"
    popper-class="my-autocomplete"
    :fetch-suggestions="querySearch"
    placeholder="Search Product"
    @select="handleSelect"
  >
    <i slot="suffix" class="el-icon-edit el-input__icon" @click="handleIconClick" />
    <template slot-scope="{ item }">
      <div class="value">{{ item.value }}</div>
      <span class="link">{{ item.link }}</span>
    </template>
  </el-autocomplete>
</template>
<script>
import Resource from '@/api/resource';
const ProductResource = new Resource('ScanProduct');
export default {
  data() {
    return {
      links: [],
      state: '',
    };
  },
  mounted() {
    this.links = this.FindProduct();
  },
  methods: {
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
    createFilter(queryString) {
      return link => {
        return (
          link.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0
        );
      };
    },
    handleSelect(item) {
      console.log(item);
    },
    handleIconClick(ev) {
      console.log(ev);
    },
  },
};
</script>
<style scoped>
.my-autocomplete {
  li {
    line-height: normal;
    padding: 7px;
    .value {
      text-overflow: ellipsis;
      overflow: hidden;
    }
    .link {
      font-size: 12px;
      color: #b4b4b4;
    }
  }
}
</style>

