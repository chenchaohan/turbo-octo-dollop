<template>
  <!-- 素材中心->  我要上传 -->
  <div class="container">
    <van-form @submit="onSubmit">
      <van-cell-group>
        <van-field
          name="title"
          v-model="titleValue"
          label="素材标题："
          placeholder="请输入素材标题！"
          :rules="[{ required: true, message: '请输入素材标题' }]"
        />

        <van-field name="uploader" label="素材内容:">
          <template #input>
            <van-uploader v-model="uploader" />
          </template>
        </van-field>

        <van-field
          name="messages"
          v-model="messages"
          rows="2"
          autosize
          label="素材文案:"
          type="textarea"
          maxlength="100"
          placeholder="请输入素材文案内容"
          show-word-limit
          @blur="getMessage(messages)"
          :rules="[{ required: true, message: '请输入素材文案内容' }]"
        />
        <div class="material">
          <p>素材标签：</p>
          <ul class="tags">
            <li
              v-for="item in tags"
              :key="item.name"
              :class="{ active: item.isactive }"
            >
              {{ item.name }}
            </li>
          </ul>
        </div>

        <van-field name="radio" label="是否原创">
          <template #input>
            <van-radio-group v-model="radio" direction="horizontal">
              <van-radio name="1">是</van-radio>
              <van-radio name="2">否</van-radio>
            </van-radio-group>
          </template>
        </van-field>

        <div>
            <van-cell is-link title="选择办理业务" @click="show = true" />
              <van-action-sheet
                v-model="show"
                :actions="actions"
                @select="onSelect"
              />
          <van-field name="yewu" v-if="yewu"  v-model="yewu">
            <template #input>
              <van-cell v-model="yewu" />
            </template>
          </van-field>
        </div>
      </van-cell-group>

      <div style="margin: 16px">
        <van-button round block type="info" native-type="submit">提交</van-button>
      </div>
    </van-form>
  </div>
</template>
  
<script>
export default {
  data() {
    return {
      titleValue: "",
      uploader: [{ url: "https://img01.yzcdn.cn/vant/leaf.jpg" }],
      messages: "",
      radio: "1",
      tags: [
        { name: "5G", isactive: false },
        { name: "视频", isactive: false },
        { name: "宽带", isactive: true },
        { name: "福利", isactive: false },
        { name: "防诈骗", isactive: false },
      ],
      show: false,
      actions: [
        { name: "业务一 59元升级5G大礼包" },
        { name: "业务二 99元宽带500M" },
        { name: "业务三 199元 宽带1000M" },
      ],
      yewu: "",
    };
  },
  methods: {
    onSelect(item) {
      // 默认情况下点击选项时不会自动收起
      // 可以通过 close-on-click-action 属性开启自动收起
      this.show = false;
      this.yewu = item.name;
      console.log(item.name);
    },
    onSubmit(values) {
      console.log("submit", values);
    },
    getMessage(msg) {
      this.messages = msg;
      console.log(this.messages);
    },
  },
};
</script>
  
<style lang="less" scoped>
.material {
  padding: 0.2rem 0.4rem;
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

.van-cell__label span{
    font-weight: bolder;
    font-size: 20px;
}
</style>
  