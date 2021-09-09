<template>
  <div>
    <van-cell>
      <!-- <van-tabs v-model="active">
        <van-tab title="企业话术">企业话术</van-tab>
        <van-tab title="个人话术">个人话术</van-tab>
      </van-tabs> -->
      <van-button>企业话术</van-button>
      <van-button class="new" type="primary">新建</van-button>
    </van-cell>

    <van-cell>
      <van-search v-model="searchVal" placeholder="请输入搜索关键词" />
    </van-cell>

    <van-cell>
      <div class="">
        <ul class="tags">
          <li
            v-for="(item, index) in tags"
            :key="item.name"
            @click="sortWordList(item, index)"
            :class="{ active: index == isactive }"
          >
            {{ item.name }}
          </li>
        </ul>
      </div>
    </van-cell>

    <van-cell-group>
      <van-cell
        v-for="item in wordList"
        :key="item.value"
        :title="item.title"
        :value="item.value"
      />
    </van-cell-group>
  </div>
</template>
<script>
export default {
  data() {
    return {
      active: "1",
      searchVal: "",
      tags: [
        {
          name: "全部",
        },
        {
          name: "默认分组",
        },
        {
          name: "语音通话",
        },
        {
          name: "安装与使用",
        },
        {
          name:"对公打款"
        },
        {
          name:"费用查询"
        },
        {
          name:"微信支付"
        }

      ],
      isactive: 0,
      wordList: [
        {
          title: "话术一",
          value: "这是系统自动回复！",
          tag: "全部",
        },
        {
          title: "安装",
          value: "帅哥，你有什么安装问题",
          tag: "安装与使用",
        },
      ],
    };
  },
  mounted() {},
  methods: {
    sortWordList(item, index) {
      this.isactive = index;
      let arr = this.wordList;
      
      
    },
  },
};
</script>

<style scoped>
.new {
  float: right;
}

.tags li {
  display: inline-block;
  margin: 6px;
  padding: 4px;
  border-radius: 4px;
  border: 1px solid black;
}
.active {
  background: #584ce1;
}
</style>