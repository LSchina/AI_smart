import { createRouter, createWebHashHistory } from 'vue-router'
const router = createRouter({
    // 指定路由模式
    history: createWebHashHistory(),
    // 路由地址
    routes: [
        {
            /*最常见404匹配规则：没有找到对应路径地址 */
            path: "/:pathMath(.*)*",
            name: "notfound",
            component: () => import("../views/404/404.vue"),
        },
        {
            path: "/login",
            component: () => import("../views/login/Login.vue"),
        },
        {
            path: "/home",
            component: () => import("../views/Layout.vue"),
            redirect:'/home/index',
            children: [
                {
                    path: "/home/data",
                    component: () => import("../views/Data.vue"),
                },
                {
                    path: "/home/index",
                    component: () => import("../views/Index.vue"),
                },
                {
                    path: "/home/chart",
                    component: () => import("../views/Chart.vue"),
                },
                {
                    path: "/home/me",
                    component: () => import("../views/Me.vue"),
                },
                {
                    path: "/home/question",
                    component: () => import("../views/Question.vue"),
                },
                {
                    path: "/home/message",
                    component: () => import("../views/Message.vue"),
                },
                {
                    path: "/home/send",
                    component: () => import("../views/Send.vue"),
                },
            ]
        },
        {
            path: "/",
            redirect: "/login"
        },
        {
            path: "/demo",
            component: () => import("../views/Demo.vue"),
        },
    ]
})
export default router