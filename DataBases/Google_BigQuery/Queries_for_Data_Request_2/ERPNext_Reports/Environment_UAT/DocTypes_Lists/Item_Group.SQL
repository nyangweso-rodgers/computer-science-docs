select 
    ig.name,
    date(ig.creation) as creation_date,
    ig.creation as creation_datetime,
    date(ig.modified) as modified_date,
    ig.modified as modified_datetime,
    ig.docstatus,
    ig.kyosk_type,
    ig.parent,
    ig.item_group_name,
    ig.parent_item_group,
    ig.old_parent
from `tabItem Group` ig