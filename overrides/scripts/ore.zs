import crafttweaker.item.IItemStack;

val removeRecipe = [
	<galacticraftcore:basic_block_core:9>, 		// Copper Block
	<projectred-exploration:stone:8>, 			// Copper Block
	<projectred-exploration:stone:9>,			// Tin Block
	<galacticraftcore:basic_block_core:10>,		// Tin Block
	<bewitchment:block_of_silver>,				// Silver Block
	<bewitchment:block_of_silver_old>,			// Silver Block
	<projectred-exploration:stone:10>,			// Silver Block
	<projectred-exploration:stone:7>,			// Peridot Block
	<projectred-exploration:stone:5>, 			// Ruby Block
	<projectred-exploration:stone:6> 			// Sapphire Block
] as IItemStack[];

val removeAndHide = [
	<galacticraftcore:basic_item:3>, 			// Copper Ingot
	<projectred-core:resource_item:100>, 		// Copper Ingot
	<galacticraftcore:basic_block_core:5>, 		// Copper Ore
	<projectred-exploration:ore:3>, 			// Copper Ore
	<galacticraftcore:basic_item:4>, 			// Tin Ingot
	<projectred-core:resource_item:101>, 		// Tin Ingot
	<projectred-exploration:ore:4>, 			// Tin Ore
	<galacticraftcore:basic_block_core:6>,		// Tin Ore
	<projectred-exploration:ore:5>,				// Silver Ore
	<bewitchment:silver_ore>,					// Silver Ore
	<bewitchment:silver_ingot>,					// Silver Ingot
	<projectred-core:resource_item:102>,		// Silver Ingot
	<galacticraftcore:basic_item:5>,			// Aluminum Ingot
	<bigreactors:ingotsteel>, 					// Steel Ingot
	<bigreactors:duststeel>, 					// Steel Dust
	<galacticraftplanets:basic_item_venus:1>, 	// Lead Ingot
	<projectred-exploration:ore>, 				// Ruby Ore
	<projectred-core:resource_item:200>, 		// Ruby Item
	<projectred-exploration:ore:2>,				// Peridot Ore
	<projectred-core:resource_item:202>, 		// Peridot Item
	<projectred-exploration:ore:1>,				// Sapphire Ore
	<projectred-core:resource_item:201>, 		// Sapphire Item
	<thermalfoundation:tool.hoe_silver>,		// Silver Hoe
	<thermalfoundation:tool.axe_silver>,		// Silver Axe
	<thermalfoundation:tool.pickaxe_silver>,	// Silver Pickaxe
	<thermalfoundation:tool.shovel_silver>,		// Silver Shovel
	<thermalfoundation:tool.sword_silver>,		// Silver Sword
	<thermalfoundation:armor.boots_silver>,		// Silver Boots
	<thermalfoundation:armor.legs_silver>,		// Silver Leggings
	<thermalfoundation:armor.plate_silver>,		// Silver Chestplate
	<thermalfoundation:armor.helmet_silver>		// Silver Helmet
] as IItemStack[];

// Remove items from JEI and remove recipes
for item in removeAndHide {
	furnace.remove(item);
	mods.jei.JEI.removeAndHide(item);
	for entry in oreDict.entries {
		entry.remove(item);
	}
}

// Only remove recipes
for item in removeRecipe {
	furnace.remove(item);
	recipes.remove(item);
}

// Ruby Chisel Group
mods.chisel.Carving.addGroup("rubyBlock");
mods.chisel.Carving.addVariation("rubyBlock", <projectred-exploration:stone:5>);
mods.chisel.Carving.addVariation("rubyBlock", <biomesoplenty:gem_block:1>);

// Peridot Chisel Group
mods.chisel.Carving.addGroup("peridotBlock");
mods.chisel.Carving.addVariation("peridotBlock", <projectred-exploration:stone:7>);
mods.chisel.Carving.addVariation("peridotBlock", <biomesoplenty:gem_block:2>);

// Sapphire Chisel Group
mods.chisel.Carving.addGroup("sapphireBlock");
mods.chisel.Carving.addVariation("sapphireBlock", <projectred-exploration:stone:6>);
mods.chisel.Carving.addVariation("sapphireBlock", <biomesoplenty:gem_block:6>);