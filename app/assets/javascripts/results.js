"use strict";

function showExpenses(evt) {
    $('#calculated-totals').hide();
    $('#expense-table').toggle();
}

$('body').on('click', '#expense-btn', showExpenses);


function showCalculations(evt) {
    $('#expense-table').hide();
    $('#calculated-totals').toggle();
}

$('body').on('click', '#calculations-btn', showCalculations);
