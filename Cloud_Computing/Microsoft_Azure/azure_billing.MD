## Azure subscription
When you sign up, an __Azure subscription__ is created by default. An __Azure subscription__ is a logical container used to provision resources in Azure. It holds the details of all your resources like __virtual machines__ (VMs), __databases__, and more. When you create an Azure resource like a VM, you identify the subscription it belongs to. As you use the VM, the usage of the VM is aggregated and billed monthly.

## Create additional Azure subscriptions
You might want to create additional subscriptions for resource or billing management purposes. For example, you might choose to create additional subscriptions to separate:

### 1. Environments: 
When managing your resources, you can choose to create subscriptions to set up separate environments for development and testing, security, or to isolate data for compliance reasons. This is particularly useful because resource access control occurs at the subscription level.
### 2. Organizational structures: 
You can create subscriptions to reflect different organizational structures. For example, you could limit a team to lower-cost resources, while allowing the IT department a full range. This design allows you to manage and control access to the resources that users provision within each subscription.

### 3. Billing: 
You might want to also create additional subscriptions for billing purposes. Because costs are first aggregated at the subscription level, you might want to create subscriptions to manage and track costs based on your needs. For instance, you might want to create a subscription for your production workloads and another subscription for your development and testing workloads.

You might also need additional subscriptions due to:

### 4. Subscription limits: 
Subscriptions are bound to some hard limitations. For example, the maximum number of Express Route circuits per subscription is 10. Those limits should be considered as you create subscriptions on your account. If there is a need to go over those limits in particular scenarios, then you might need additional subscriptions.