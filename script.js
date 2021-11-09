
const snoowrap = require('snoowrap');
const Markov = require('js-markov');

const r = new snoowrap({
  userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:10.0) Gecko/20100101 Firefox/10.0',
  clientId: 'lmcbm0SWTU4miNnf6jFCIA',
  clientSecret: 'Iw141PHYbXZFplmHZ921G0QAb3-xVg',
  refreshToken: '19268393-Ae6AY4Kf8GvYgemraTfXTXeWiRyjZw'
});

let com = []
let markov = new Markov()

r.getSubmission('mn8km4').comments.fetchMore({amount: 500, sort: 'top'}).then(comment => {
    markov.clearChain();
    markov.clearPossibilities();

    comment.forEach( c => {
        let index = c.body.toLowerCase().indexOf("edit")
        c.body.replace(/(\r\n|\n|\r)/gm, "")
        if(index != -1){
            com.push(c.body.slice(0,index))
        } else com.push(c.body)
    })

    com.forEach(c=> {
        markov.addStates(c)
        // console.log(c)
        // console.log('=')
    })

    markov.train(10)

    for(let i = 0; i < 10; i++){
        console.log('+++++++++')
        console.log(markov.generateRandom(1000))
    }
})
