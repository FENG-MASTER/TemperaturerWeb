/**
 * 跳转到指定url,解决缓存问题
 * @param url
 */
function goTo(url) {

    var rand = Math.random();

    if (url.length == 0 || url.indexOf('javascript') > -1) return;
    else if (url.indexOf('?') > -1) {
        window.location.href=url + '&' + rand;
    } else {
        window.location.href=url  + '?' + rand;

    }
}