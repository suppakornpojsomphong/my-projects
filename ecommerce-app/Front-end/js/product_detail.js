const plus = document.querySelector(".plus");
const minus = document.querySelector(".minus");
const num = document.querySelector(".num");

let a = 1;

plus.addEventListener("click", () => {
    a++;
    a = (a < 10) ? "0" + a : a;
    num.innerText = a;
});

minus.addEventListener("click", () => {
    if (a > 1) {
        a--;
        a = (a < 10) ? "0" + a : a;
        num.innerText = a;
    }
});

document.addEventListener('DOMContentLoaded', function () {
    let icon = document.getElementById('icon');
    let addDetail = document.querySelector('.additional-info');

    icon.addEventListener('click', function () {
        addDetail.classList.toggle('show');
        icon.classList.toggle('up');
    });
});

// API


function submitTranslate() {
    const productDetails = document.querySelector('.product-detail p').textContent;
    console.log("Translate button has been clicked!!");
    translateText(productDetails);
}

function translateText(productDetails) {
    const url = 'https://google-translate113.p.rapidapi.com/api/v1/translator/text';

    fetch(url, {
        "method": 'POST',
        "headers": {
            'content-type': 'application/x-www-form-urlencoded',
            'X-RapidAPI-Key': '384aca628amshf3442c6f909f160p14bd7cjsnfba3b36a7d0d',
            'X-RapidAPI-Host': 'google-translate113.p.rapidapi.com'
        },
        "body": new URLSearchParams({
            "from": 'en',
            "to": 'th',
            "text": productDetails
        })
    })
    .then(response => response.json())
    .then(data => {
        console.log(data.trans);
        const resultsDiv = document.getElementById('prod-detail');
        resultsDiv.innerHTML = ''; // Clear previous results
        resultsDiv.textContent = data.trans;
    })
    .catch(err => {
        console.log(err);
        alert('Translation error: ' + err.message);
    });
}



