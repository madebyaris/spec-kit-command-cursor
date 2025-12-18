# 🚀 SDD Cursor Commands v3.0 - Hướng Dẫn Tiếng Việt

<div align="center">

[![GitHub stars](https://img.shields.io/github/stars/madebyaris/spec-kit-command-cursor?style=social)](https://github.com/madebyaris/spec-kit-command-cursor/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Phát Triển Phần Mềm Hướng Đặc Tả (Spec-Driven Development) cho Cursor IDE**

*AI agents thực thi trực tiếp từ đặc tả - không phải mô tả mơ hồ, mà là hướng dẫn rõ ràng*

[🚀 Bắt Đầu Nhanh](#-bắt-đầu-nhanh) • [📖 Các Lệnh](#-danh-sách-lệnh-sdd) • [🎯 Ví Dụ](#-ví-dụ-workflow) • [📁 Cấu Trúc](#-cấu-trúc-dự-án)

</div>

---

## 📋 Mục Lục

- [SDD là gì?](#-sdd-là-gì)
- [Cách hoạt động](#-cách-hoạt-động)
- [Bắt đầu nhanh](#-bắt-đầu-nhanh)
- [Danh sách lệnh SDD](#-danh-sách-lệnh-sdd)
- [Ví dụ Workflow](#-ví-dụ-workflow)
- [**Áp dụng cho dự án đã có code**](#-áp-dụng-sdd-cho-dự-án-đã-có-code) ⭐
- [Cấu trúc dự án](#-cấu-trúc-dự-án)
- [Tích hợp chế độ Cursor](#-tích-hợp-chế-độ-cursor)

---

## 🎯 SDD Là Gì?

**SDD (Spec-Driven Development - Phát triển Hướng Đặc Tả)** là phương pháp phát triển phần mềm trong đó bạn tạo **đặc tả chi tiết TRƯỚC KHI** viết code.

### Lợi Ích Chính

| Vấn Đề Thường Gặp | Giải Pháp SDD |
|-------------------|---------------|
| 😰 Viết code mà không biết rõ yêu cầu | 🎯 Yêu cầu được định nghĩa rõ ràng trước khi code |
| 😵 Kiến trúc lộn xộn, thiếu kế hoạch | 🏗️ Quyết định kỹ thuật được lập kế hoạch và tài liệu hóa |
| 😓 Task quá lớn, không biết bắt đầu từ đâu | 📋 Các task được chia nhỏ, có thể quản lý |
| 🤖 AI code lung tung, không theo hướng | 🤝 AI agents thực thi có hệ thống với hướng dẫn rõ ràng |

### Sự Khác Biệt Của Phương Pháp Agentic

**Cách cũ (mơ hồ):**
> "Lệnh này giúp tạo đặc tả..."

**Cách mới (Agentic):**
> "**Bạn là một agent đặc tả.** Công việc của bạn là tạo yêu cầu chi tiết. **Bạn SẼ** đặt câu hỏi làm rõ và định nghĩa tiêu chí chấp nhận. **Bạn SẼ KHÔNG** viết code triển khai hoặc bỏ qua phần trình bày kế hoạch."

---

## ⚙️ Cách Hoạt Động

### Nguyên Tắc Cốt Lõi: Lập Kế Hoạch → Phê Duyệt → Thực Thi

```
Người dùng ra lệnh → AI Phân tích → Hiện Kế hoạch → Bạn Phê duyệt → AI Thực thi → Xác minh
```

### Quy Trình 4 Giai Đoạn

```
┌─────────────────────────────────────────────────────────────────┐
│                    QUY TRÌNH SDD                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   1️⃣ PHÂN TÍCH        2️⃣ LẬP KẾ HOẠCH      3️⃣ THỰC THI       │
│   ┌─────────┐        ┌─────────┐         ┌─────────┐          │
│   │ Đọc tài │   →    │ Trình   │    →    │ Tạo    │          │
│   │ liệu có │        │ bày kế  │         │ output │          │
│   │ sẵn     │        │ hoạch   │         │ file   │          │
│   └─────────┘        └─────────┘         └─────────┘          │
│        │                  │                   │                │
│        │                  ↓                   │                │
│        │           ⏸️ CHỜ DUYỆT               │                │
│        │                  │                   │                │
│        │                  ↓                   ↓                │
│                                         4️⃣ XÁC MINH           │
│                                         ┌─────────┐           │
│                                         │ Kiểm   │           │
│                                         │ tra    │           │
│                                         │ output │           │
│                                         └─────────┘           │
└─────────────────────────────────────────────────────────────────┘
```

### Cấu Trúc Template Agentic

Mỗi lệnh đều tuân theo cấu trúc này:

```markdown
# /command

## QUAN TRỌNG: Đây là Chế độ [Mode]

**Bạn là một [vai trò].** Công việc của bạn là [mục đích].

**Vai trò của bạn:**
- [Việc bạn sẽ làm 1]
- [Việc bạn sẽ làm 2]

**Giới hạn chế độ (Việc bạn SẼ KHÔNG làm):**
- [Hành động bị cấm 1]
- [Hành động bị cấm 2]

## State Assertion (BẮT BUỘC)
**SDD MODE: [Command]**
Mode: [planning|implementation|research|verification]
Implementation: [BLOCKED|AUTHORIZED]

## Self-Correction Protocol (Giao Thức Tự Sửa)
**PHÁT HIỆN** → **DỪNG** → **SỬA** → **TIẾP TỤC**
```

---

## 🚀 Bắt Đầu Nhanh

### 1. Cài Đặt

```bash
# Clone repo về máy
git clone https://github.com/madebyaris/spec-kit-command-cursor.git

# Di chuyển vào thư mục
cd spec-kit-command-cursor
```

### 2. Copy Vào Dự Án Của Bạn

Copy 2 thư mục sau vào dự án của bạn:
- `.cursor/` - Chứa các slash commands
- `.sdd/` - Chứa hướng dẫn và templates

```bash
# Cấu trúc sau khi copy
your-project/
├── .cursor/
│   ├── commands/    # Các lệnh SDD
│   └── rules/       # Rules tự động áp dụng
├── .sdd/
│   ├── guidelines.md
│   ├── templates/
│   └── ...
└── src/             # Code của bạn
```

### 3. Sử Dụng Lệnh Đầu Tiên

> ⚠️ **QUAN TRỌNG:** Các lệnh SDD là **Cursor Chat Slash Commands**, KHÔNG phải terminal commands!

**Cách chạy đúng:**
```
1. Mở Cursor IDE trong dự án của bạn
2. Nhấn Ctrl+L (Windows/Linux) hoặc Cmd+L (Mac) để mở Chat Panel
3. Gõ lệnh trong chat (ví dụ: /brief user-auth Mô tả...)
4. Nhấn Enter - AI sẽ trả lời trong chat
```

**Ví dụ lệnh (gõ trong Cursor Chat):**
```
# Lập kế hoạch nhanh 30 phút (80% tính năng)
/brief user-auth Hệ thống đăng nhập với JWT

# Tạo roadmap đầy đủ cho dự án
/sdd-full-plan blog-platform Blog với CMS quản lý nội dung

# Tạo PRD thông qua câu hỏi
/generate-prd mobile-app

# Kiểm tra code so với đặc tả
/audit user-auth Lỗi đăng nhập trên mobile
```

> ❌ **SAI:** Chạy trong PowerShell/Terminal → Sẽ báo lỗi "not recognized"
> ✅ **ĐÚNG:** Chạy trong Cursor Chat Panel → AI sẽ phản hồi

---

## 📖 Danh Sách Lệnh SDD

### 🚀 Workflow Chính (80% tính năng dùng cách này)

| Lệnh | Mục Đích | Output |
|------|----------|--------|
| `/brief` | Lập kế hoạch 30 phút → bắt đầu code | `feature-brief.md` |
| `/evolve` | Cập nhật spec trong quá trình phát triển | Brief cập nhật với changelog |
| `/refine` | Lặp lại spec thông qua thảo luận | Tài liệu được tinh chỉnh |

### 📊 Lập Kế Hoạch Dự Án Đầy Đủ

| Lệnh | Mục Đích | Output |
|------|----------|--------|
| `/sdd-full-plan` | Roadmap A-Z hoàn chỉnh | Kanban board + tasks |
| `/execute-task` | Chạy task từ roadmap | Thực thi với lệnh SDD phù hợp |
| `/generate-prd` | PRD qua câu hỏi Socratic | `full-prd.md` + `quick-prd.md` |

### 🏗️ Workflow Nâng Cao (20% tính năng phức tạp)

| Lệnh | Mục Đích | Output |
|------|----------|--------|
| `/research` | Nghiên cứu patterns (chỉ đọc) | `research.md` |
| `/specify` | Yêu cầu chi tiết | `spec.md` |
| `/plan` | Kiến trúc kỹ thuật | `plan.md` |
| `/tasks` | Phân chia task | `tasks.md` |
| `/implement` | Thực thi triển khai | Code + `todo-list.md` |

### 🔧 Tiện Ích

| Lệnh | Mục Đích | Output |
|------|----------|--------|
| `/upgrade` | Brief → Full SDD 2.0 | Bộ planning hoàn chỉnh |
| `/audit` | Kiểm tra kỹ thuật theo spec | Báo cáo audit với fixes |
| `/generate-rules` | Tự động tạo coding rules | `.cursor/rules/*.mdc` |

---

## 🎯 Ví Dụ Workflow

### Workflow 1: Tính Năng Nhanh (SDD 2.5)

Dành cho 80% tính năng thông thường:

```bash
# Bước 1: Tạo brief 30 phút
/brief checkout-flow Checkout nhanh cho khách vãng lai

# Bước 2: Bắt đầu code! Cập nhật khi phát hiện điều mới
/evolve checkout-flow Thêm lưu giỏ hàng cho khách

# Bước 3: Tinh chỉnh nếu cần
/refine checkout-flow
```

**Thời gian:** ~30 phút lập kế hoạch → Code ngay

### Workflow 2: Dự Án Đầy Đủ (sdd-full-plan)

Dành cho dự án lớn cần roadmap:

```bash
# Bước 1: Tạo roadmap hoàn chỉnh
/sdd-full-plan ecommerce-platform Sàn thương mại đa vendor

# Bước 2: Thực thi từng task từ roadmap
/execute-task epic-001
/execute-task task-001-1

# Bước 3: Kiểm tra issues
/audit task-001-1 Payment processing đang fail
```

### Workflow 3: Tính Năng Phức Tạp (SDD 2.0)

Dành cho 20% tính năng phức tạp cần nghiên cứu kỹ:

```bash
# Bước 1: Nghiên cứu patterns
/research payment-system Tích hợp Stripe patterns

# Bước 2: Định nghĩa yêu cầu
/specify payment-system

# Bước 3: Thiết kế kiến trúc
/plan payment-system

# Bước 4: Phân chia tasks
/tasks payment-system

# Bước 5: Triển khai
/implement payment-system
```

**Thời gian:** 2-4 giờ lập kế hoạch → Code có kiến trúc rõ ràng

### Workflow 4: Tạo PRD

```bash
# Tạo PRD qua câu hỏi hướng dẫn
/generate-prd saas-dashboard

# AI sẽ hỏi 5 câu hỏi chiến lược, sau đó tạo:
# - full-prd.md (chi tiết đầy đủ)
# - quick-prd.md (tối ưu cho AI)
```

---

## 🔄 Áp Dụng SDD Cho Dự Án Đã Có Code

Nếu bạn đã có dự án **đang triển khai** hoặc **đã hoàn thành một phần**, đây là cách để Cursor hiểu và tiếp tục phát triển có hệ thống.

### Bước 1: Copy SDD Commands Vào Dự Án

```bash
# Copy 2 thư mục vào dự án hiện tại
cp -r spec-kit-command-cursor/.cursor your-existing-project/
cp -r spec-kit-command-cursor/.sdd your-existing-project/
```

### Bước 2: Tạo Thư Mục Specs

```bash
# Tạo cấu trúc thư mục specs
mkdir -p specs/active
mkdir -p specs/todo-roadmap
```

### Bước 3: Chọn Workflow Phù Hợp

#### 🅰️ Trường Hợp 1: Thêm Tính Năng Mới vào Dự Án Có Sẵn

```bash
# Tạo brief cho tính năng mới
/brief new-feature Mô tả tính năng mới cần thêm

# Hoặc tạo roadmap cho nhiều tính năng
/sdd-full-plan project-v2 Các tính năng cần bổ sung: feature1, feature2, feature3
```

**AI sẽ:**
1. Phân tích codebase hiện tại
2. Hiểu cấu trúc dự án
3. Tạo specs tương thích với code có sẵn

#### 🅱️ Trường Hợp 2: Tái Cấu Trúc (Refactor) Code Hiện Tại

```bash
# Bước 1: Nghiên cứu code hiện tại
/research refactor-auth Phân tích hệ thống authentication hiện tại

# Bước 2: Lên kế hoạch refactor
/plan refactor-auth

# Bước 3: Phân chia tasks refactor
/tasks refactor-auth

# Bước 4: Triển khai từng phần
/implement refactor-auth
```

#### 🅲️ Trường Hợp 3: Tạo Tài Liệu Specs Từ Code Hiện Tại

Nếu muốn **reverse-engineer** specs từ code có sẵn:

```bash
# Cách 1: Dùng /research để AI phân tích và tóm tắt
/research existing-auth Phân tích và tài liệu hóa hệ thống auth hiện tại

# Cách 2: Dùng /audit để kiểm tra và tạo documentation
/audit existing-module Tạo tài liệu từ code module hiện tại
```

**Sau đó tạo spec thủ công hoặc nhờ AI:**

```bash
# Yêu cầu AI tạo spec từ phân tích
"Dựa trên phân tích trên, hãy tạo file specs/active/auth-system/spec.md 
mô tả chi tiết hệ thống authentication hiện tại"
```

#### 🅳️ Trường Hợp 4: Tạo Roadmap Cho Dự Án Đang Dở

```bash
# Tạo roadmap với context dự án hiện tại
/sdd-full-plan my-app Dự án đang có: auth, dashboard. Cần thêm: payment, reports, admin panel

# AI sẽ:
# 1. Phân tích code hiện tại
# 2. Xác định các module đã có
# 3. Tạo roadmap cho phần còn lại
```

### Ví Dụ Thực Tế: Dự Án E-commerce Đang Dở

**Tình huống:** Bạn có dự án e-commerce đã có:
- ✅ User auth
- ✅ Product listing
- ❌ Shopping cart (chưa có)
- ❌ Checkout (chưa có)
- ❌ Payment (chưa có)

**Cách làm:**

```bash
# Bước 1: Tạo roadmap cho phần còn lại
/sdd-full-plan ecommerce-completion Hoàn thiện dự án e-commerce. 
Đã có: user-auth, product-listing. 
Cần thêm: shopping-cart, checkout, payment-integration, order-management

# Output: specs/todo-roadmap/ecommerce-completion/
#   ├── roadmap.json
#   ├── roadmap.md
#   └── tasks/

# Bước 2: Thực thi từng task
/execute-task epic-001  # Shopping cart
/execute-task epic-002  # Checkout
/execute-task epic-003  # Payment

# Hoặc chạy tự động
/execute-task epic-001 --until-finish
```

### Tips Quan Trọng Cho Dự Án Có Sẵn

| Tip | Mô Tả |
|-----|-------|
| 📂 **Mô tả context rõ ràng** | Khi chạy lệnh, mô tả những gì dự án ĐÃ CÓ để AI không tạo trùng |
| 🔍 **Dùng `/research` trước** | Cho AI phân tích codebase trước khi lên kế hoạch |
| 📝 **Tạo spec cho code cũ** | Reverse-engineer specs để có tài liệu đầy đủ |
| 🎯 **Đặt tên task-id rõ ràng** | Ví dụ: `add-cart`, `refactor-auth`, `fix-payment` |
| ✅ **Review kế hoạch** | AI sẽ show plan trước khi thực thi - kiểm tra kỹ |

### Cấu Trúc Thư Mục Sau Khi Áp Dụng

```
your-existing-project/
├── .cursor/
│   ├── commands/        # ✅ SDD commands (mới copy)
│   └── rules/           # ✅ Rules (mới copy)
├── .sdd/
│   └── templates/       # ✅ Templates (mới copy)
├── specs/
│   ├── active/          # ✅ Tính năng đang phát triển
│   │   ├── add-cart/
│   │   │   ├── feature-brief.md
│   │   │   └── plan.md
│   │   └── refactor-auth/
│   │       └── research.md
│   └── todo-roadmap/    # ✅ Roadmap dự án
│       └── ecommerce-completion/
│           ├── roadmap.md
│           └── tasks/
├── src/                 # Code hiện tại của bạn
│   ├── auth/           # Đã có
│   ├── products/       # Đã có
│   └── ...
└── package.json
```

---

## 🚀 Cờ `--until-finish`

**Chế độ thực thi tự động** - chạy toàn bộ dự án mà không cần dừng!

```bash
# Thực thi toàn bộ epic tự động
/execute-task epic-001 --until-finish

# Tạo roadmap VÀ thực thi tất cả
/sdd-full-plan my-project App hoàn chỉnh với auth --until-finish
```

**Cách hoạt động:**
1. Thực thi tất cả tasks theo thứ tự dependency
2. Không cần phê duyệt giữa các tasks
3. **Dừng khi có lỗi** - báo cáo để bạn fix
4. Tiếp tục với cùng lệnh sau khi fix
5. Chạy cho đến khi hoàn thành

```
Bắt đầu → Task 1 ✅ → Task 2 ✅ → Task 3 ❌ Lỗi → DỪNG → Fix → Tiếp tục → Task 3 ✅ → Xong! 🎉
```

---

## 📁 Cấu Trúc Dự Án

```
your-project/
├── .cursor/
│   ├── commands/           # Các slash commands SDD
│   │   ├── _shared/       # Protocols dùng chung
│   │   │   ├── agent-manual.md
│   │   │   ├── self-correction.md
│   │   │   └── cursor-modes.md
│   │   ├── brief.md       # Lệnh /brief
│   │   ├── research.md    # Lệnh /research
│   │   ├── specify.md     # Lệnh /specify
│   │   ├── plan.md        # Lệnh /plan
│   │   ├── tasks.md       # Lệnh /tasks
│   │   ├── implement.md   # Lệnh /implement
│   │   ├── evolve.md      # Lệnh /evolve
│   │   ├── audit.md       # Lệnh /audit
│   │   ├── generate-prd.md
│   │   ├── sdd-full-plan.md
│   │   └── execute-task.md
│   └── rules/
│       └── sdd-system.mdc  # Rules tự động áp dụng
│
├── .sdd/
│   ├── guidelines.md       # Hướng dẫn phương pháp
│   ├── templates/          # Templates có sẵn
│   │   ├── feature-brief-v2.md
│   │   ├── spec-template.md
│   │   ├── plan-template.md
│   │   └── tasks-template.md
│   └── IMPLEMENTATION_GUIDE.md
│
├── specs/
│   ├── active/            # Tính năng đang phát triển
│   │   └── [task-id]/
│   │       ├── feature-brief.md
│   │       ├── spec.md
│   │       ├── plan.md
│   │       └── tasks.md
│   └── todo-roadmap/      # Roadmaps dự án
│       └── [project-id]/
│           ├── roadmap.json
│           ├── roadmap.md
│           └── tasks/
│
└── src/                   # Code của bạn
```

---

## 🔧 Tích Hợp Chế Độ Cursor

### Bảng Ánh Xạ Lệnh - Chế Độ

| Lệnh SDD | Chế Độ Cursor | Lý Do |
|----------|---------------|-------|
| `/brief` | Plan | Tạo specs không thay đổi code |
| `/research` | Ask | Khám phá chỉ đọc |
| `/specify` | Plan | Định nghĩa yêu cầu |
| `/plan` | Plan | Thiết kế kiến trúc |
| `/tasks` | Plan | Phân chia task |
| `/implement` | Agent | Thay đổi nhiều file |
| `/audit` | Debug | Audit theo spec với bằng chứng runtime |

### Cách Chuyển Chế Độ

- **Mac:** `Cmd + .`
- **Windows/Linux:** `Ctrl + .`

### Sử Dụng Debug Mode với /audit

Cursor Debug Mode kết hợp hoàn hảo với lệnh `/audit`:

1. **Chuyển sang Debug Mode** (`Ctrl + .`)
2. **Chạy `/audit [task-id]`** để so sánh code với specs
3. **Tận dụng tính năng Debug Mode** cho bằng chứng runtime:
   - Tạo giả thuyết
   - Log instrumentation
   - Phân tích runtime

---

## 📝 Chi Tiết Lệnh `/sdd-full-plan`

Tạo roadmap A-Z hoàn chỉnh cho dự án.

### Workflow Chi Tiết

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    WORKFLOW /sdd-full-plan                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  PHASE 1: ANALYSIS (AI hỏi câu hỏi)                                        │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │  AI hỏi 7 câu hỏi:                                                   │   │
│  │  1. Goal - Mục tiêu dự án?                                          │   │
│  │  2. Users - Ai sử dụng?                                             │   │
│  │  3. Tech Stack - Công nghệ?                                         │   │
│  │  4. Timeline - Thời hạn?                                            │   │
│  │  5. Team - Bao nhiêu dev?                                           │   │
│  │  6. Must-haves - Tính năng bắt buộc?                                │   │
│  │  7. Nice-to-haves - Tính năng phụ?                                  │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                              ↓                                              │
│                     [Bạn trả lời]                                           │
│                              ↓                                              │
│  PHASE 2: PLANNING (AI show preview)                                       │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │  AI hiển thị "Project Roadmap Preview":                             │   │
│  │  - Complexity level                                                  │   │
│  │  - Epic structure                                                    │   │
│  │  - Total tasks & effort                                              │   │
│  │  - Files sẽ tạo                                                      │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                              ↓                                              │
│                    [Bạn phê duyệt]                                          │
│                              ↓                                              │
│  AI hỏi: "Option A: One-by-One" hoặc "Option B: Immediate"?                │
│                              ↓                                              │
│                    [Bạn chọn A hoặc B]                                      │
│                              ↓                                              │
│  PHASE 3: EXECUTION (AI tạo files)                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │  AI tạo các files:                                                   │   │
│  │  specs/todo-roadmap/[project-id]/                                   │   │
│  │  ├── roadmap.json    (Kanban data)                                  │   │
│  │  ├── roadmap.md      (Human-readable)                               │   │
│  │  ├── tasks/          (Task files)                                   │   │
│  │  └── execution-log.md                                               │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                              ↓                                              │
│  PHASE 4: VERIFICATION (AI verify)                                         │
│                              ↓                                              │
│                         ✅ XONG!                                            │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Ví Dụ Thực Tế

**Bước 1: Bạn gõ lệnh trong Cursor Chat**
```
/sdd-full-plan ecommerce-completion Hoàn thiện dự án ecommerce. 
Đang build product và cart nhưng còn lỗi. 
Cần fix bug + thêm checkout, order-management
```

**Bước 2: AI hỏi câu hỏi**
```
Before I create the roadmap, I need some information:

1. Goal: What's the primary goal/problem this solves?
2. Users: Who are the target users?
3. Tech Stack: Any technology preferences?
4. Timeline: Any deadline or timeline constraints?
5. Team: How many developers will work on this?
6. Must-haves: What are the 3-5 critical features?
7. Nice-to-haves: What features can wait for later versions?
```

**Bước 3: Bạn trả lời**
```
1. Ưu tiên fix bug hiện tại, sau đó thêm tính năng mới
2. Khách hàng mua hàng online
3. Laravel 12
4. 2 tuần
5. 1 developer
6. Fix cart bugs, checkout flow, order management
7. Payment gateway, email notifications
```

**Bước 4: AI show preview và hỏi execution mode**
```
## Project Roadmap Preview

**Complexity:** Medium
**Estimated duration:** 2 weeks
**Recommended approach:** SDD 2.5 (Brief)

**Epic Structure:**
1. Epic 1: Bug Fixes - 3 tasks
2. Epic 2: Checkout Flow - 4 tasks  
3. Epic 3: Order Management - 3 tasks

**Total tasks:** 10
**Estimated effort:** 40 hours

Does this structure look right?
---
How would you like to proceed?
A: One-by-One Processing
B: Immediate Execution
```

**Bước 5: Bạn chọn → AI tạo files**

---

## 📝 Chi Tiết Lệnh `/audit`

Kiểm tra kỹ thuật theo đặc tả, so sánh triển khai với specifications:

```bash
/audit user-auth Lỗi đăng nhập trên mobile
```

**Lệnh này làm gì:**
1. Đọc specifications (spec.md, plan.md)
2. Kiểm tra triển khai thực tế
3. So sánh code với yêu cầu
4. Tạo Review Board với mức độ nghiêm trọng
5. Đề xuất fixes sau khi điều tra

**Output mẫu:**
```
📋 Báo Cáo Audit Đã Sẵn Sàng

Tóm tắt:
- 🔴 Critical: 1 issue (SQL injection)
- 🟠 Major: 2 issues (thiếu validation)
- 🟡 Minor: 3 issues (naming, comments)

Để fix: "Fix #1" hoặc "Fix all critical"
```

---

## 📝 Chi Tiết Lệnh `/generate-prd`

Tạo PRD thông qua câu hỏi Socratic:

```bash
/generate-prd mobile-banking
```

**5 câu hỏi AI sẽ hỏi:**
1. Vấn đề và mục tiêu là gì?
2. Các tính năng bắt buộc phải có?
3. Có yêu cầu kỹ thuật nào?
4. Điều gì rõ ràng nằm ngoài phạm vi?
5. Có điều gì khác tôi cần biết?

**Output:**
- `full-prd.md` - PRD đầy đủ chi tiết
- `quick-prd.md` - Tóm tắt tối ưu cho AI

---

## 💡 Mẹo Sử Dụng

### Chọn Workflow Phù Hợp

| Loại Tính Năng | Workflow Đề Xuất |
|----------------|------------------|
| Tính năng nhỏ, rõ ràng | `/brief` → code ngay |
| Tính năng phức tạp | `/research` → `/specify` → `/plan` → `/tasks` → `/implement` |
| Dự án mới | `/sdd-full-plan` hoặc `/generate-prd` |
| Bug fix theo spec | `/audit` |

### Best Practices

1. **Luôn đọc output** - AI sẽ hiển thị kế hoạch trước khi thực thi
2. **Phê duyệt có chọn lọc** - Yêu cầu thay đổi nếu kế hoạch chưa đúng
3. **Sử dụng `--until-finish`** cho automation - nhưng kiểm tra output định kỳ
4. **Cập nhật specs** với `/evolve` khi yêu cầu thay đổi
5. **Dùng `/audit`** để kiểm tra code có match specs không

---

## ❓ FAQ - Câu Hỏi Thường Gặp

### Q: Khi nào dùng `/brief` vs workflow đầy đủ?

**A:** Dùng `/brief` cho 80% tính năng thông thường (30 phút → code). Dùng workflow đầy đủ (`/research` → `/specify` → `/plan` → `/tasks`) cho tính năng phức tạp cần nghiên cứu kỹ.

### Q: Lệnh không hoạt động?

**A:** Đảm bảo:
- Đã copy thư mục `.cursor/commands/` vào dự án
- Cursor IDE đã nhận diện được commands
- Restart Cursor nếu cần

### Q: Làm sao để tùy chỉnh templates?

**A:** Edit các file trong `.sdd/templates/` theo nhu cầu dự án.

### Q: `--until-finish` có an toàn không?

**A:** Có, flag này sẽ **dừng ngay khi có lỗi** và báo cáo để bạn fix. Sau khi fix, chạy lại cùng lệnh để tiếp tục.

### Q: Dự án đã có code rồi, làm sao để Cursor hiểu?

**A:** Có 3 cách:

1. **Thêm tính năng mới:** Dùng `/brief [feature-name] [mô tả]` hoặc `/sdd-full-plan` - AI sẽ tự động phân tích codebase hiện tại

2. **Refactor code cũ:** Dùng `/research [module-name] Phân tích module X` trước, rồi `/plan` và `/implement`

3. **Tạo specs từ code có sẵn:** Dùng `/research [module] Tài liệu hóa module` để AI tạo documentation

**Quan trọng:** Khi chạy lệnh, mô tả rõ những gì dự án **ĐÃ CÓ** để AI không tạo trùng.

### Q: Làm sao để AI không tạo lại code đã có?

**A:** Khi chạy lệnh, mô tả context rõ ràng:

```bash
# ✅ Tốt - mô tả context
/sdd-full-plan my-app Đã có: auth, products. Cần thêm: cart, payment

# ❌ Không tốt - thiếu context  
/sdd-full-plan my-app E-commerce platform
```

### Q: Dự án lớn nhiều module, nên bắt đầu từ đâu?

**A:** 
1. Chạy `/research project-overview Tổng quan kiến trúc dự án` để AI phân tích
2. Xác định module cần phát triển tiếp
3. Chạy `/sdd-full-plan` cho phần cần thêm
4. Thực thi từng task với `/execute-task`

---

## 🤝 Đóng Góp

Chúng tôi ❤️ đóng góp!

- 🐛 **Báo bugs** - [Mở issue](https://github.com/madebyaris/spec-kit-command-cursor/issues)
- 💡 **Đề xuất tính năng** - [Bắt đầu thảo luận](https://github.com/madebyaris/spec-kit-command-cursor/discussions)
- 🔧 **Submit PRs** - Cải tiến được hoan nghênh!
- ⭐ **Star repo** - Thể hiện sự ủng hộ!

---

## 📄 Giấy Phép

MIT License - xem file [LICENSE](LICENSE) để biết chi tiết.

---

<div align="center">

**Made with ❤️ by [Aris](https://github.com/madebyaris)**

### 🎊 Thử Lệnh Đầu Tiên!

```bash
/brief hello-world Tạo tính năng hello world đơn giản
```

[⬆️ Về đầu trang](#-sdd-cursor-commands-v30---hướng-dẫn-tiếng-việt)

</div>

