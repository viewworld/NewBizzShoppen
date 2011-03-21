var bIsFirebugReady = (!!window.console && !!window.console.log);

function initInvoiceCalculations() {
    $("input[name$='[quantity]'], input[name$='[netto_price]'], input[name$='[vat_rate]']").bind("keyup", recalcValues);
    $("input[name$='[netto_value]']").bind("change", recalcValues);
    $("#invoice_charge_vat").bind("change", change_vat_fields_availibility);
    $("#invoice_charge_vat").bind("change", recalcValues);
    $("input[name$='[brutto_value]']").bind("keyup", recalcBruttoValuesWithoutBruttoUpdate);
    $("input[name$='[brutto_value]']").bind("change", recalcBruttoValues);
    // run the calculation function now
    change_vat_fields_availibility();
    recalcValues();
}

function recalcBruttoValuesWithoutBruttoUpdate(){
    $("[name$='[netto_price]']").calc(
            "brutto_value / ((1.0 + vat_rate) * Math.floor(quantity))",
    {
        brutto_value: $("input[name$='[brutto_value]']"),
        vat_rate: $("[name$='[vat_rate]']"),
        quantity: $("[name$='[quantity]']")
    },
            function (s) {
                return s.toFixed(2) + "";
            },
            function ($this) {
                 // do nothing
            }
            );

    recalc_netto_value();
    recalc_vat_value();
}

function recalcBruttoValues(){
    $("[name$='[netto_price]']").calc(
            "brutto_value / ((1.0 + vat_rate) * Math.floor(quantity))",
    {
        brutto_value: $("input[name$='[brutto_value]']"),
        vat_rate: $("[name$='[vat_rate]']"),
        quantity: $("[name$='[quantity]']")
    },
            function (s) {
                return s.toFixed(2) + "";
            },
            function ($this) {
                 // do nothing
            }
            );

    recalcValues();
}

function recalcValues()
{
    recalc_netto_value();
    recalc_vat_value();
    recalc_brutto_value();
}

$(document).ready(
        function () {
            // update the plug-in version
            $("#idPluginVersion").text($.Calculation.version);

            // bind the recalc function to the quantity fields
            initInvoiceCalculations();
            // automatically update the "#totalSum" field every time
            // the values are changes via the keyup event
            // TODO $("input[name^=sum]").sum("keyup", "#totalSum");
        }
        );

function recalc_netto_value() {

    //netto_value
    $("[name$='[netto_value]']").calc(
            "Math.floor(qty) * price",
    {
        qty: $("input[name$='[quantity]']"),
        price: $("[name$='[netto_price]']")
    },
            function (s) {
                return s.toFixed(2) + "";
            },
            function ($this) {

                // sum the total of the $("[id^=total_item]") selector

                 var sum = $this.filter(":visible").sum();
                 $("#total_netto_value").text(
                 // round the results to 2 digits
                 sum.toFixed(2)  + ""
                 );
            }
            );
}

function recalc_vat_value() {

    //netto_value
    $("[name$='[vat_value]']").calc(
            "netto_value * (vat_rate / 100)",
    {
        netto_value: $("input[name$='[netto_value]']"),
        vat_rate: $("[name$='[vat_rate]']")
    },
            function (s) {
                return s.toFixed(2) + "";
            },
            function ($this) {
                    // sum the total of the $("[id^=total_item]") selector

                 var sum = $this.filter(":visible").sum();
                 $("#total_vat_value").text(
                 // round the results to 2 digits
                 sum.toFixed(2)  + ""
                 );
            }
            );
}

function recalc_brutto_value() {

    //netto_value
    $("[name$='[brutto_value]']").calc(
            "netto_value + vat_value",
    {
        netto_value: $("input[name$='[netto_value]']"),
        vat_value: $("[name$='[vat_value]']")
    },
            function (s) {
                return s.toFixed(2) + "";
            },
            function ($this) {
                    // sum the total of the $("[id^=total_item]") selector

                 var sum = $this.filter(":visible").sum();
                 $("#total_brutto_value").text(
                 // round the results to 2 digits
                 sum.toFixed(2)  + ""
                 );
            }
            );
}

function change_vat_fields_availibility() {
    val = $("#invoice_charge_vat")[0].checked;
    $("input[id$='_vat_rate']").each(function(){
        if (val == false) {
            this.value = '0';
        }
        this.disabled = !val;
    });
}