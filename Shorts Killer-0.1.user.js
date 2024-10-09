// ==UserScript==
// @name         Shorts Killer
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Browsing shorts as videos
// @author       Strax
// @match        https://www.youtube.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=youtube.com
// @grant        none
// ==/UserScript==



let shortsUrl = "https://www.youtube.com/shorts/"
let currentUrl = ""
let pastUrl = ""
let shortsHistory = {}
let fromShorts = false

function print(str) {
    console.log(str)
}


function checkIfShorts(url) {
    return url.search(shortsUrl) != -1
}

function generateVideo(url) {
    return url.replace("shorts/", "watch?v=")
}


(function() {

    print("Shorts Killer started")



    let urlObserver = new MutationObserver((mutations) => {
        if (window.location.href != currentUrl) {
            pastUrl = currentUrl
            currentUrl = window.location.href
            if (checkIfShorts(currentUrl)) {
                window.location.assign(generateVideo(currentUrl))
                fromShorts = true
                let video = document.querySelector('video')
                video.addEventListener("ended", (event) => {
                    window.alert("ended")
                })
            }
            else {
                fromShorts = false
            }
        }
    })

    urlObserver.observe(document.querySelector("body"), {childList: true, subtree: true})

})();