let editingIndex = -1; // Khởi tạo biến toàn cục để lưu chỉ số của sinh viên đang được chỉnh sửa

function emailIsValid(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function save() {
    let fullname = document.getElementById('fullname').value;
    let email = document.getElementById('email').value;
    let phone = document.getElementById('phone').value;
    let address = document.getElementById('address').value;
    let gender = '';
    if (document.getElementById('male').checked) {
        gender = document.getElementById('male').value;
    }
    else if (document.getElementById('female').checked) {
        gender = document.getElementById('female').value;
    }

    console.log(fullname, email, phone, address, gender);

    if (_.isEmpty(fullname)) {
        document.getElementById('fullname_error').innerHTML = '*Không được để trống ô này';
    } else {
        document.getElementById('fullname_error').innerHTML = '';
    }

    if (_.isEmpty(email)) {
        document.getElementById('email_error').innerHTML = '*Không được để trống ô này';
    } else if (!emailIsValid(email)) {
        document.getElementById('email_error').innerHTML = '*email không đúng, mời nhập lại'; 
    } else {
        document.getElementById('email_error').innerHTML = '';
    }

    if (_.isEmpty(phone)) {
        document.getElementById('phone_error').innerHTML = '*Mời nhập số điện thoại';
    } else if (phone.trim().length < 10) {
        document.getElementById('phone_error').innerHTML = 'Số điện thoại không đúng';
    } else {
        document.getElementById('phone_error').innerHTML = '';
    }

    if (_.isEmpty(address)) {
        document.getElementById('address_error').innerHTML = '*Không được để trống ô này';
    } else {
        document.getElementById('address_error').innerHTML = '';
    }

    if (_.isEmpty(gender)) {
        document.getElementById('gender_error').innerHTML = '*Vui lòng chọn giới tính của bạn';
    } else {
        document.getElementById('gender_error').innerHTML = '';
    }

    if (fullname && email && phone && address && gender) {
        let students = localStorage.getItem('students') ? JSON.parse(localStorage.getItem('students')) : [];

        if (editingIndex === -1) {
            // Thêm mới sinh viên
            if (confirm('Bạn có chắc chắn muốn lưu thông tin sinh viên này không?')) {
                students.push({
                    fullname: fullname,
                    email: email,
                    phone: phone,
                    address: address,
                    gender: gender,
                });
                localStorage.setItem('students', JSON.stringify(students));
                renderListStudent();
                resetForm();
            }
        } else {
            // Cập nhật sinh viên đang chỉnh sửa
            if (confirm(`Bạn có chắc chắn muốn cập nhật thông tin sinh viên ${fullname} trong danh sách không?`)) {
                students[editingIndex] = {
                    fullname: fullname,
                    email: email,
                    phone: phone,
                    address: address,
                    gender: gender,
                };
                editingIndex = -1;
                localStorage.setItem('students', JSON.stringify(students));
                renderListStudent();
                resetForm();
            }
        }
    }    
}

function renderListStudent() {
    let students = localStorage.getItem('students') ? JSON.parse(localStorage.getItem('students')) : [];
    
    if (students.length === 0) {
        document.getElementById('list-student').style.display = 'none';
        return false;
    }

    document.getElementById('list-student').style.display = 'block';
    
    let tableContent = `<tr>
        <td>STT</td>
        <td>Họ và tên</td>
        <td>Email</td>
        <td>Giới tính</td>
        <td>Điện thoại</td>
        <td>Địa chỉ</td>
        <td>Hành động</td>
    </tr>`;

    students.forEach((student, index) => {
        let genderLabel = parseInt(student.gender) === 1 ? 'Nam' : 'Nữ';
        index++;
        tableContent += `<tr>
            <td>${index}</td>
            <td>${student.fullname}</td>
            <td>${student.email}</td>
            <td>${genderLabel}</td>
            <td>${student.phone}</td>
            <td>${student.address}</td>
            <td>
                <a href='#' onclick='editStudent(${index - 1})'>Edit</a> |
                <a href='#' onclick='deleteStudent(${index - 1})'>Delete</a>
            </td>
        </tr>`;
    });

    document.getElementById('list-student').innerHTML = tableContent;
}

function deleteStudent(index) {
    let students = localStorage.getItem('students') ? JSON.parse(localStorage.getItem('students')) : [];
    let student = students[index];
    if (confirm(`Bạn có chắc chắn muốn xóa sinh viên ${student.fullname} khỏi danh sách không?`)) {
        students.splice(index, 1);
        localStorage.setItem('students', JSON.stringify(students));
        renderListStudent();
    }
}

function editStudent(index) {
    let students = localStorage.getItem('students') ? JSON.parse(localStorage.getItem('students')) : [];
    let student = students[index];

    document.getElementById('fullname').value = student.fullname;
    document.getElementById('email').value = student.email;
    document.getElementById('phone').value = student.phone;
    document.getElementById('address').value = student.address;
    if (parseInt(student.gender) === 1) {
        document.getElementById('male').checked = true;
    } else {
        document.getElementById('female').checked = true;
    }

    editingIndex = index; // Lưu lại chỉ số của sinh viên đang được chỉnh sửa
}

function resetForm() {
    document.getElementById('fullname').value = '';
    document.getElementById('email').value = '';
    document.getElementById('phone').value = '';
    document.getElementById('address').value = '';
    document.getElementById('male').checked = false;
    document.getElementById('female').checked = false;
}
