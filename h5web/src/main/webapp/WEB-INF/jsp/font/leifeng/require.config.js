require.config({
    baseUrl: baseUrl,
    paths: {
        jquery:'lib/jquery-1.12.4.min',
        tmpl:'lib/jquery.tmpl.min',
        swiper:'lib/swiper/swiper.min',
        layer:'lib/layer/layer',
        css: 'lib/css',
        text: 'lib/text'
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
require(["lib/jquery.tmpl.ext"],function(){});