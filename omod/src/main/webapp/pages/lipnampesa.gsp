<% ui.decorateWith("appui", "standardEmrPage", [title: "lipa na mpesa"]) %>

<body></body>
<header>
</header>

<div class="container">
    <div class="example">
        <ul id="breadcrumbs">
            <li>
                <a href="#">
                    <i class="icon-home small"></i></a>
            </li>
            <li>
                <i class="icon-chevron-right link"></i>
                <a href="#">Lipa na M-Pesa</a>
            </li>
            <li>
            </li>
        </ul>
    </div>

    <div class="patient-header new-patient-header">
        <div class="demographics">
            <br/>

            <div id="stacont" class="status-container">
                <span class="status active"></span>
                Visit Status
            </div>

            <div class="tag">Payment in process</div>
        </div>

        <div class="clear"></div>
    </div>
</div>


<ul style=" margin-top: 10px;" class="grid"></ul>


<form method="post" id="lipanampesaForm" action="lipanampesaForm.page?ipdWard=100126282">
    <div style="float: left">
        <img src="/openmrs/ms/uiframework/resource/ipdapp/images/patient-transfer.png"
             style="border-right: 1px solid #eee; height: 185px; margin-right: 10px; padding: 5px 15px 0 5px;">
    </div>

    <div style="display: block; overflow:hidden">

                   <label>Bill code</label>
            <span>
                <input required="" name="billCode" id="billCode" type="number">
            </span>
            <label>Business Number</label>
            <span>
                <input required="" name="businessNumber" id="businessNumber" type="number">
            </span>
            <label>Account Number</label>
            <span>
                <input required="" name="accountNumber" id="accountNumber" type="number">
            </span>
            <label>Amount</label>
            <span>
                <input required="" name="paymentAmount" id="paymentAmount" type="number">
            </span>


            <label></label>
            <span style="margin-top: 5px">
                <a type="submit" class="button confirm right" id="payButton" style="margin-right: 0px !important;">
                    <i class="icon-hospital"></i>
                    Pay
                </a>
                <a type="submit" class="button cancel">
                    <i class="icon-remove "></i>
                    Cancel
                </a>
            </span>

        </div>
    </form>
<style>

.f2:hover {
    background-color: #00CC00;
    box-shadow: 0 0 11px rgba(33, 33, 33, .2);
    cursor: pointer;
}

.toast-item {
    background-color: #222;
}

.morebuttons {
    display: inline;
    float: left;
    margin-left: 20px;
}

.tableelement {
    width: auto;
    min-width: 10px;
}

.vitalstatisticselements {
    float: left;
    margin-left: 10px;
    margin-bottom: 10px;
}

.vitalstatisticselements textarea {
    height: 23px;
    width: 183px;
}

.selecticon {
    float: right;
    vertical-align: middle;
    font-size: x-large;
}

.selectp {
    min-width: 450px;
    border-bottom: solid;
    border-bottom-width: 1px;
    padding-left: 5px;
    margin-top: 20px;
}

.selectdiv {
    width: 450px;
    margin-top: 10px;
}

#breadcrumbs a, #breadcrumbs a:link, #breadcrumbs a:visited {
    text-decoration: none;
}

.name {
    color: #f26522;
}

.new-patient-header .demographics .gender-age {
    font-size: 14px;
    margin-left: -55px;
    margin-top: 12px;
}

.new-patient-header .demographics .gender-age span {
    border-bottom: 1px none #ddd;
}

.new-patient-header .identifiers {
    margin-top: 5px;
}

.tag {
    padding: 2px 10px;
}

.tad {
    background: #666 none repeat scroll 0 0;
    border-radius: 1px;
    color: white;
    display: inline;
    font-size: 0.8em;
    padding: 2px 10px;
}

.status-container {
    padding: 5px 10px 5px 5px;
}

.catg {
    color: #363463;
    margin: 25px 10px 0 0;
}

#tabs {
    background: #f9f9f9 none repeat scroll 0 0;
    padding: 10px;
}

#tab-container {
    background: #f9f9f9 none repeat scroll 0 0;
    margin-top: 3px;
}

.ui-tabs .ui-tabs-panel {
    background: #fff none repeat scroll 0 0;
    padding-top: 0;
}

.col12 {
    display: inline-block;
    float: left;
    width: 50%;
}

.col13 {
    display: inline-block;
    float: left;
    width: auto;
}

.col15 {
    display: inline-block;
    float: left;
    max-width: 22%;
    min-width: 22%;
}

.col16 {
    display: inline-block;
    float: left;
    width: 78%;
}

.dashboard .action-section {
    background: white none repeat scroll 0 0;
    border: 1px solid #ddd;
    margin-top: 35px;
}

.dashboard .info-body label {
    display: inline-block;
    font-size: 90%;
    margin-bottom: 6px;
    margin-left: 5px;
    width: 115px;
}

.dashboard .info-body span {
    color: #000;
    font-size: 0.9em;
}

.zero-em {
    font-size: 0em !important;
}

.dashboard .info-header h3 {
    color: #f26522;
}

.daily-vitals label {
    float: left;
}

.daily-vitals span {
    display: block;
    overflow: hidden;
    padding-right: 10px;
}

.daily-vitals input,
.daily-vitals select,
.daily-vitals textarea {
    width: 100%;
    resize: none;
}

.ui-widget-content a.right {
    cursor: pointer;
    font-size: 16px;
}

.ui-widget-content a.right:hover,
.ui-widget-content a.right:hover i {
    color: #3399ff;
    text-decoration: none;
}

form input:focus, form select:focus, form textarea:focus, form ul.select:focus, .form input:focus, .form select:focus, .form textarea:focus, .form ul.select:focus {
    outline: 0px none #007fff;
    box-shadow: 0 0 2px 0 #888;
}

.dashboard .action-section a:not(.button) {
    cursor: pointer;
}
</style>


<div class="clear"></div>
