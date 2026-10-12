# DevOps IT209 - Session 12

## Thông tin học viên
- **Học viên:** Nguyễn Quang Vinh (Vinh Nguyen)
- **Tài khoản GitHub:** [`QuangVinh1605`](https://github.com/QuangVinh1605)
- **Repository:** [QuangVinh1605/IT209-SS12-CAU3](https://github.com/QuangVinh1605/IT209-SS12-CAU3)

---

## Bài 3: Tách biệt luồng CI/CD đa môi trường (Staging & Production) với GitHub Environments

### 1. Mục tiêu bài tập
- Quản lý hạ tầng triển khai đa môi trường (**Staging** vs **Production**) thông qua tính năng GitHub Environments.
- Cấu hình **Environment Protection Rules** yêu cầu phê duyệt thủ công (`Required reviewers`) trước khi deploy lên Production.
- Định nghĩa quy trình CD trong [`.github/workflows/cd-multi-env.yml`](.github/workflows/cd-multi-env.yml):
  - Job `deploy-staging` với `environment: staging` (kích hoạt khi push vào `develop`).
  - Job `deploy-prod` với `environment: production` (kích hoạt khi push vào `main`).

### 2. Minh chứng thực thi
- **Workflow dừng lại ở bước chờ phê duyệt khi push vào `main`:**
  ![Waiting for Review](homework/session_12/ex3/screenshots/waiting_for_review.png)

- **Cửa sổ phê duyệt deployment môi trường Production (Review Modal):**
  ![Production Approval Modal](homework/session_12/ex3/screenshots/production_approval_modal.png)

- **Workflow thực thi tích xanh sau khi phê duyệt thành công:**
  ![Production Approved](homework/session_12/ex3/screenshots/production_approved.png)

### 3. Tài liệu bài tập
- Báo cáo chi tiết và hướng dẫn kiểm chứng: [`homework/session_12/ex3/README.md`](homework/session_12/ex3/README.md)
- Script kiểm tra tự động: [`homework/session_12/ex3/commands.sh`](homework/session_12/ex3/commands.sh)
