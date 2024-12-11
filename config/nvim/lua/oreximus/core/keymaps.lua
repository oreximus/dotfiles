vim.g.mapleader = " "

local keymap = vim.keymap -- for concisenes

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- for making file executable
keymap.set("n", "<leader>wx", "<cmd>!chmod +x %<CR>", { desc = "Make file executable" })

-- Stay in indent mode
keymap.set("v", "<", "<gv", { desc = "" })
keymap.set("v", ">", ">gv", { desc = "" })

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", { desc = "" })
keymap.set("v", "<A-k>", ":m .-2<CR>==", { desc = "" })

-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "" })
keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "" })
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "" })
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "" })
