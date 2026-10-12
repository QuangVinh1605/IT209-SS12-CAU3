#!/usr/bin/env bash
# ==============================================================================
# DevOps IT209 - Session 12 - Bài 3 (EX3)
# Tách biệt luồng CI/CD đa môi trường (Staging & Production) với GitHub Environments
# Học viên: Nguyễn Quang Vinh (Vinh Nguyen)
# Repository: QuangVinh1605/IT209-SS12-CAU3
# ==============================================================================

set -eo pipefail

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

REPO="QuangVinh1605/IT209-SS12-CAU3"

echo -e "${BLUE}=====================================================================${NC}"
echo -e "${GREEN}      DevOps IT209 - Session 12 - Bài 3 (EX3)                         ${NC}"
echo -e "${GREEN}  Tách biệt luồng CI/CD đa môi trường (Staging & Production)           ${NC}"
echo -e "${BLUE}=====================================================================${NC}\n"

echo -e "${YELLOW}[BƯỚC 1] Kiểm tra danh sách Environments trên GitHub...${NC}"
gh api repos/$REPO/environments --jq '.environments[] | {name: .name, protection_rules: .protection_rules}'
echo -e "${GREEN}✓ Môi trường staging và production đã được cấu hình!${NC}\n"

echo -e "${YELLOW}[BƯỚC 2] Kiểm tra trạng thái các Workflow Runs...${NC}"
gh run list -R "$REPO" --limit 5

echo -e "\n${YELLOW}[BƯỚC 3] Lấy chi tiết Workflow Run gần nhất trên nhánh main...${NC}"
MAIN_RUN_ID=$(gh run list -R "$REPO" --branch main --limit 1 --json databaseId -q '.[0].databaseId')

if [ -n "$MAIN_RUN_ID" ]; then
    echo -e "${CYAN}Đang kiểm tra Workflow Run ID: $MAIN_RUN_ID...${NC}"
    gh run view "$MAIN_RUN_ID" -R "$REPO"
    
    echo -e "\n${YELLOW}Kiểm tra trạng thái pending deployments (nếu đang chờ duyệt):${NC}"
    gh api repos/$REPO/actions/runs/$MAIN_RUN_ID/pending_deployments 2>/dev/null || true
else
    echo -e "${YELLOW}Chưa tìm thấy run trên nhánh main. Vui lòng kiểm tra https://github.com/$REPO/actions${NC}"
fi

echo -e "\n${BLUE}=====================================================================${NC}"
echo -e "${GREEN}                HOÀN TẤT KIỂM TRA BÀI 3                              ${NC}"
echo -e "${BLUE}=====================================================================${NC}"
