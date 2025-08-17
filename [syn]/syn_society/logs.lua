Logs = {}
Logs.webhook = true -- turn webhooks for each job on or off 
Logs.adminwebhook = true -- turn admin webhook on or off 
Logs.adminwebhooklink = "https://discord.com/api/webhooks/" -- input your webhook

Logs.webhookColor = 16777215 -- White color for webhooks
Logs.webhookLogo = "https://via.placeholder.com/30x30" -- Logo for webhooks
Logs.webhookFooterLogo = "https://via.placeholder.com/30x30" -- Footer logo for webhooks
Logs.webhookAvatar = "https://via.placeholder.com/30x30" -- Avatar for webhooks


--logs for On and off duty actions only 
Logs.dutywebhooks = { 
    doctor = "https://discord.com/api/webhooks/",
    shaman = "https://discord.com/api/webhooks",
    police = "https://discord.com/api/webhooks/",
    marshal = "https://discord.com/api/webhooks/",

    --add more Job name here and set the webhook = true in Config.jobs
}


--Logs for Job Storage and Ledger and other job related actions
 Logs.JobWebhooks = {
    doctor = "https://discord.com/api/webhooks/",
    drbarber = "https://discord.com/api/webhooks/",
    police = "https://discord.com/api/webhooks/",
    marshal = "https://discord.com/api/webhooks/",
    -- add Job name here and set the webhook = true in Config.jobs
 }





Logs.DepositcashLogs = "Deposit cash Log"
Logs.WithDrawCashLogs = "Withdraw cash Log"
Logs.TakeFromContainerLogs = "Take from container Log"
Logs.MoveToContainerLogs = "Move to container Log"
Logs.IssueBillLogs = "Issue Bill Log"
Logs.paidBillLogs = "Paid Bill Log"
Logs.addcashEvent = "add cash Event triggered by a script "