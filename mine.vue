<template>
    <van-pull-refresh v-model="isLoading" success-text="刷新成功" @refresh="onRefresh">
        <div class="layer small-material-center-layer">
            <!---------------------------------------- 顶部用户相关信息 ------------------------------------>
            <div class="top">
                <div class="title-bg"></div>
                <div class="title">
                    <p>X</p>
                    <p>我的</p>
                    <p>...</p>
                </div>
                <div class="content">
                    <div class="info">
                        <div class="avatar">
                            <div class="pic-100">
                                <img :src="avatar" @click="WDQRClick()"/>
                            </div>
                        </div>
                        <div class="text">
                            <div class="name">
                                {{ memberName }}
                                <van-tag class="title-icon" type="primary" size="medium" v-for="(tip, index) in WdTip" :key="index">
                                    {{ tip.tipName }}
                                </van-tag>
                            </div>
                            <div class="other-info" v-if="memberHall">{{ memberHall }}</div>
                        </div>
                    </div>
                    <div class="back-btn"></div>
                </div>
                <div class="bg">
                    <div class="pic-100">
                        <img src="@/assets/images/small-shop-202103/bg_01.jpg"/>
                    </div>
                </div>
            </div>
            <!---------------------------------------- 昨日概况 ------------------------------------>
            <div class="box-a">
                <div class="info">
                    <van-icon class="circle" name="circle"/>
                    <van-icon name="arrow"/>
                </div>
                <div class="title">
                    <span></span>
                    昨日情况
                </div>
                <div class="data">
                    <div>
                        <p>访问人数</p>
                        <p>100</p>
                    </div>
                    <div>
                        <p>新访问人数</p>
                        <p>100</p>
                    </div>
                    <div>
                        <p>成交单数</p>
                        <p>100</p>
                    </div>
                    <div>
                        <p>结算收益(元)</p>
                        <p>100</p>
                    </div>
                </div>
            </div>
            <!---------------------------------------- 今日数据 ------------------------------------>
            <div class="box-b">
                <div class="info">
                    <van-icon class="circle" name="circle"/>
                    <van-icon name="arrow"/>
                </div>
                <div class="title">
                    <span>今日数据</span>
                    <span>截止：2021年8月30日 18:58:07</span>
                </div>
                <div class="data">
                    <div>
                        <p>访问人数</p>
                        <p>100</p>
                    </div>
                    <div>
                        <p>新访问人数</p>
                        <p>100</p>
                    </div>
                    <div>
                        <p>成交单数</p>
                        <p>100</p>
                    </div>
                    <div>
                        <p>结算收益(元)</p>
                        <p>100</p>
                    </div>
                </div>
            </div>
            <!---------------------------------------- 七日数据趋势 ------------------------------------>
            <div class="box-c">
                <div class="info">
                    <van-icon class="circle" name="circle"/>
                    <van-icon name="arrow"/>
                </div>
                <div class="title">
                    <span></span>
                    七日数据趋势
                </div>
                <div class="data">
                    <div>
                        <p>访问人数</p>
                        <p>100</p>
                    </div>
                    <div>
                        <p>新访问人数</p>
                        <p>100</p>
                    </div>
                    <div>
                        <p>成交单数</p>
                        <p>100</p>
                    </div>
                    <div>
                        <p>结算收益(元)</p>
                        <p>100</p>
                    </div>
                </div>
            </div>
            <van-tabbar v-model="active" active-color="#1e4eff" inactive-color="#d0d2da">
                <van-tabbar-item to="/MaterialCenter">
                    <template #icon="props">
                        <img :src="props.active ? materialCenterIcon.active : materialCenterIcon.inactive"/>
                    </template>
                    素材库
                </van-tabbar-item>
                <van-tabbar-item to="/MaterialCenterRanking">
                    <template #icon="props">
                        <img :src="props.active ? materialCenterRankingIcon.active : materialCenterRankingIcon.inactive"/>
                    </template>
                    排行榜
                </van-tabbar-item>
                <van-tabbar-item>
                    <template #icon="props">
                        <img :src="props.active ? materialCenterMineIcon.active : materialCenterMineIcon.inactive"/>
                    </template>
                    我的
                </van-tabbar-item>
            </van-tabbar>
        </div>
    </van-pull-refresh>
</template>

<script>
    import {Toast, PullRefresh} from 'vant'
    import Vue from 'vue'

    Vue.use(PullRefresh);

    export default {
        data() {
            return {
                isLoading: false,
                avatar: '',
                memberName: 'MK192',

                active: 2,
                materialCenterIcon: {
                    active: require('@/assets/images/small-shop-202101/3-1-01.png'),
                    inactive: require('@/assets/images/small-shop-202101/3-2-01.png')
                },
                materialCenterRankingIcon: {
                    active: require('@/assets/images/small-shop-202101/3-1-02.png'),
                    inactive: require('@/assets/images/small-shop-202101/3-2-02.png')
                },
                materialCenterMineIcon: {
                    active: require('@/assets/images/small-shop-202101/3-1-02.png'),
                    inactive: require('@/assets/images/small-shop-202101/3-2-02.png')
                },
            }
        },
        computed: {
            userInfo() {
                return this.$store.getters.userInfo
            }
        },
        created() {
            // 开启加载
            Toast.loading({message: '玩命加载中...', forbidClick: false, duration: 0, overlay: true});

            this.avatar = this.userInfo.avatar

            Toast.clear();
        },
        mounted() {
        },
        methods: {}
    }
</script>

<style lang="less" scoped>
    .small-material-center-layer {
        background-color: #fff;
    }

    .top {
        position: relative;

        .title-bg {
            width: 100%;
            height: 30px;
            position: fixed;
            top: 0;
            background-color: #00005d;
            opacity: 0.2;
        }

        .title {
            width: 100%;
            height: 30px;
            line-height: 2px;
            position: fixed;
            top: 0;
            display: flex;
            justify-content: space-between;

            color: white;
            font-size: 16px;
            font-weight: 600;

            p:first-child {
                padding-left: .4rem;
            }

            p:last-child {
                padding-right: .4rem;
                line-height: 0;
            }
        }

        .content {
            position: absolute;
            top: 0.4rem;
            left: 0;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-sizing: border-box;
            padding: 0 0.6rem;

            .info {
                display: flex;
                align-items: center;

                .avatar {
                    width: 1.4rem;
                    border: 2px solid #fff;
                    border-radius: 999px;
                    overflow: hidden;
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                }

                .text {
                    flex: 1;
                    padding-left: 0.4rem;

                    .name {
                        font-size: 16px;
                        color: #fff;
                    }

                    .other-info {
                        font-size: 12px;
                        color: #fff;
                        padding-top: 0.1rem;
                    }
                }
            }

            .back-text {
                color: #fff;
            }
        }
    }

    .box-a, .box-b, .box-c {
        background-color: #fff;
        position: relative;
        z-index: 2;
        margin: 0 0.4rem;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        padding: 0.2rem 0.4rem;
        margin-bottom: .15rem;

        .info {
            display: flex;
            align-items: center;

            .circle {
                flex: 1;
                width: 0.6rem;
                color: #2589fd;
            }
        }

        .title {
            margin-top: .4rem;
            padding-left: .1rem;
        }

        .title::after {
            content: "";
            width: .1rem;
            height: .36rem;
            position: absolute;
            top: 1rem;
            left: .3rem;
            background: #2589fd;
        }

        .data {
            display: flex;
            justify-content: space-between;
            text-align: center;

            div {
                p:first-child {
                    color: #bababa;
                }

                p:last-child {
                    font-weight: 600;
                }
            }
        }

    }

    .box-a {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        margin-top: -0.7rem;
    }

    .box-b {
        .title {
            margin-top: .4rem;
            padding-left: .1rem;
            display: flex;
            justify-content: space-between;

            span:last-child {
                color: #bababa;
            }
        }
    }
</style>
