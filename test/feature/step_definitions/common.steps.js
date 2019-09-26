var chai = require('chai');
var assert = chai.assert;
var debug = require('debug');
var debuglog = debug('ELKSEARCH:common');
var client = require("request");
var ErrorCode = require('./../support/errorCode.js');

require('dotenv').config()

var { Given, Then, When } = require('cucumber')


Given(/^I want to request api ELKSearch customer with data$/, function (table, callback) {
    var self = this;
    var params = table.hashes()[0];
    client.post({
        url: 'http://192.168.2.84:9090/ws/api/v1/search/customer',
        method: 'POST',
        headers: {
            'Authorization': 'Basic c3lzb3BzOnF3ZXJ0eTEzNTc=',
            'Content-Type': 'application/json'
        },
        body: JSON.parse(params.requestData),
        json: true
    }, function (err, httpRe, body) {
        if (err) {
            console.log(err)
            callback()
        }
        debuglog('self.storage.returnData', JSON.stringify(body))
        self.storage.returnData = body
        callback()
    })
});

Then(/^I should get the response data matches with$/, function (table) {
    var self = this;
    var expectData = JSON.parse(table.hashes()[0].response);
    debuglog("Expect data ", JSON.stringify(expectData));
    debuglog("this.storage.returnData ", JSON.stringify(this.storage.returnData));
    assert.isTrue(self.matchData(this.storage.returnData, expectData));
    return;
});

Given(/^I want to request api ELKSearch driver with data$/, function (table, callback) {
    var self = this;
    var params = table.hashes()[0];
    client.post({
        url: 'http://192.168.2.84:9090/ws/api/v1/search/driver',
        method: 'POST',
        headers: {
            'Authorization': 'Basic c3lzb3BzOnF3ZXJ0eTEzNTc=',
            'Content-Type': 'application/json'
        },
        body: JSON.parse(params.requestData),
        json: true
    }, function (err, httpRe, body) {
        if (err) {
            console.log(err)
            callback()
        }
        debuglog('self.storage.returnData', JSON.stringify(body))
        self.storage.returnData = body
        callback()
    })
});

Given(/^I want to request api ELKSearch partner with data$/, function (table, callback) {
    var self = this;
    var params = table.hashes()[0];
    client.post({
        url: 'http://192.168.2.84:9090/ws/api/v1/search/partner',
        method: 'POST',
        headers: {
            'Authorization': 'Basic c3lzb3BzOnF3ZXJ0eTEzNTc=',
            'Content-Type': 'application/json'
        },
        body: JSON.parse(params.requestData),
        json: true
    }, function (err, httpRe, body) {
        if (err) {
            console.log(err)
            callback()
        }
        debuglog('self.storage.returnData', JSON.stringify(body))
        self.storage.returnData = body
        callback()
    })
});

Then(/^The return data should be matched correctly order with$/, function (table, callback) {
    var self = this;
    var expectedData = JSON.parse(table.hashes()[0].response);
    debuglog("expectedData ", JSON.stringify(expectedData));
    debuglog("this.storage.returnData ", JSON.stringify(this.storage.returnData));
    assert.isTrue(self.matchDataWithTheSameOrder(this.storage.returnData, expectedData), "Result object is not matched with the expected one")
    callback()
});

Then(/^I should get an error object in returned data with errorCode "([^"]*)"$/, function (errorCode) {
    var self = this;
    debuglog("self.storage.returnData.status", JSON.stringify(this.storage.returnData.status));
    assert.equal(self.storage.returnData.status, ErrorCode[errorCode]);
    return
});