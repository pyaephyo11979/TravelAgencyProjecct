document.getElementById('Dashboard').style.display = 'block';
document.getElementById('busDb').style.display = 'none';
document.getElementById('flightDb').style.display = 'none';
document.getElementById('adminManage').style.display = 'none';
document.getElementById('FP').style.display = 'none';
document.getElementById('BP').style.display = 'none';
document.getElementById('homeBtn').addEventListener('click', function () {
    document.getElementById('Dashboard').style.display = 'block';
    document.getElementById('busDb').style.display = 'none';
    document.getElementById('flightDb').style.display = 'none';
    document.getElementById('adminManage').style.display = 'none';
    document.getElementById('FP').style.display = 'none';
    document.getElementById('BP').style.display = 'none';
});

document.getElementById('busBtn').addEventListener('click', function () {
    document.getElementById('Dashboard').style.display = 'none';
    document.getElementById('busDb').style.display = 'block';
    document.getElementById('flightDb').style.display = 'none';
    document.getElementById('adminManage').style.display = 'none';
    document.getElementById('FP').style.display = 'none';
    document.getElementById('BP').style.display = 'none';
});

document.getElementById('flightBtn').addEventListener('click', function () {
    document.getElementById('Dashboard').style.display = 'none';
    document.getElementById('busDb').style.display = 'none';
    document.getElementById('flightDb').style.display = 'block';
    document.getElementById('adminManage').style.display = 'none';
    document.getElementById('FP').style.display = 'none';
    document.getElementById('BP').style.display = 'none';
});

document.getElementById('adminManageBtn').addEventListener('click', function () {
    document.getElementById('Dashboard').style.display = 'none';
    document.getElementById('busDb').style.display = 'none';
    document.getElementById('flightDb').style.display = 'none';
    document.getElementById('adminManage').style.display = 'block';
    document.getElementById('FP').style.display = 'none';
    document.getElementById('BP').style.display = 'none';
});

document.getElementById('showFPBtn').addEventListener('click', function () {
    document.getElementById('Dashboard').style.display = 'none';
    document.getElementById('busDb').style.display = 'none';
    document.getElementById('flightDb').style.display = 'none';
    document.getElementById('adminManage').style.display = 'none';
    document.getElementById('FP').style.display = 'block';
    document.getElementById('BP').style.display = 'none';
});

document.getElementById('showBPBtn').addEventListener('click', function () {
    document.getElementById('Dashboard').style.display = 'none';
    document.getElementById('busDb').style.display = 'none';
    document.getElementById('flightDb').style.display = 'none';
    document.getElementById('adminManage').style.display = 'none';
    document.getElementById('FP').style.display = 'none';
    document.getElementById('BP').style.display = 'block';
});