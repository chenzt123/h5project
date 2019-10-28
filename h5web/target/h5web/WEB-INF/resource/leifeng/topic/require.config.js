require.config({
    baseUrl: baseUrl,
    paths: {
        jquery:'../resource/leifeng/lib/jquery-1.12.4.min',
        tmpl:'../resource/leifeng/lib/jquery.tmpl.min',
        swiper:'../resource/leifeng/lib/swiper/swiper.min',
        layer:'../resource/leifeng/lib/layer/layer',
        css: '../resource/leifeng/lib/css',
        text: '../resource/leifeng/lib/text'
    },
    shim:{
        layer:{
            deps:["jquery"]
        },
        tmpl:{
            deps:["jquery"]
        }
    }
});
require(["../resource/leifeng/lib/jquery.tmpl.ext"],function(){});