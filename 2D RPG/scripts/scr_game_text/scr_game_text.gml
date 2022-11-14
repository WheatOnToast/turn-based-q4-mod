//@param text_id
function scr_game_text(_text_id){
	switch(_text_id){
	case "opening_1":
		obj_opening_textbox.skip = false;
		obj_opening_textbox.textsnd = 0;
		scr_text("");
		scr_text("Our adventure begins with a book...");
		scr_text("A book filled with magic spells and little known secrets...");
		break;
	case "opening_2":
		obj_opening_textbox.skip = false;
		obj_opening_textbox.textsnd = 0;
		scr_text("");
		scr_text("It is said that the book is able to change all aspects of life.");
		scr_text("For good...");
		scr_text("Or bad...");
		break;
	case "opening_3":
		obj_opening_textbox.skip = false;
		obj_opening_textbox.textsnd = 0;
		scr_text("");
		scr_text("The cover of the book holds four orbs that contain immense power.");
		scr_text("These orbs are the key to communicate with the All-Knowing.");
		scr_text("The ancients made sure to use the book and its orbs for good.");
		scr_text("Until...");
		break;
	case "opening_4":
		obj_opening_textbox.skip = false;
		obj_opening_textbox.textsnd = 0;
		scr_text("");
		scr_text("Four beings of chaos stole the orbs from the book,");
		scr_text("splitting the power amongst themselves.");
		scr_text("These beings of chaos caused a world-shattering paradox.");
		break;
	case "opening_5":
		obj_opening_textbox.skip = false;
		obj_opening_textbox.textsnd = 0;
		scr_text("");
		scr_text("There seemed to be no hope for the ancients...");
		break;
	case "opening_6":
		obj_opening_textbox.skip = false;
		obj_opening_textbox.textsnd = 0;
		scr_text("");
		scr_text("By using what they learned from the book, the ancients saved the world.");
		break;
	case "opening_7":
		obj_opening_textbox.skip = false;
		obj_opening_textbox.textsnd = 0;
		scr_text("");
		scr_text("With the beings of chaos destroyed,");
		scr_text("the orbs scattered across the ends of the world and the book was sealed away.");
		scr_text("Thousands of years have passed...");
		scr_text("The book and orbs are lost to history...");
		break;
	case "opening_8":		
		obj_opening_textbox.skip = false;
		obj_opening_textbox.textsnd = 0;
		scr_text("");
		scr_text("Until now...");
		break;
	case "npc_1":
	    scr_text("");
		scr_text("Hi! This is npc_1!");
		break;
	case "npc_2":
		scr_text("");
		scr_text("Hi! This is npc_2!");
		scr_text("Hi! This is npc_2!");
		break;
	case "npc_3":
		scr_text("");	
		scr_text("Hi! This is npc_3!");
		scr_text("Hi! This is npc_3!");
		break;
	
	case "mabel_boss1_phase0":
		obj_textbox.skip = true;
		scr_text("Mabel: Emmet... This is where you've been the entire time?");
		scr_text("Mabel: I can't believe it's been almost 7 years since I've seen you and this...");
		scr_text("Mabel: This is what you've been doing...");
		scr_text ("Mabel: What would Mom and Pop think of this?");
		break
		
	case "test_npc_1":
		scr_text("");
		scr_text("Hi!!");
		scr_text("Such a nice day today!!");
		scr_text("Do you think so!?");
			scr_option("Yes", "test_npc_1 - yes");
			scr_option("No", "test_npc_1 - no");
		break;
		case "test_npc_1 - yes":
			obj_player.move_status = move_state.STOP;
			scr_text("Good to hear!!");
			break;
		
		case "test_npc_1 - no":
			obj_player.move_status = move_state.STOP;
			scr_text("Sorry about that!!");
			break;
	
	case "debug_sign_1":
		scr_text("");
		scr_text("Welcome to the Spiritfate Debug Room!!")
		break;
		
	case "debug_sign_bomb":
		scr_text("");
		scr_text("Would you like a bomb?");
				scr_option("Yes", "debug_sign_bomb - yes");
				scr_option("No", "debug_sign_bomb - no");
		break;
		case "debug_sign_bomb - yes":
			obj_item_manager.item_give(global.item_list.bomb);
			scr_text("Here you go.");
			scr_text("*Bomb has been added to your inventory*");
			scr_text("Have fun.");
			break;
		case "debug_sign_bomb - no":
			scr_text("Oh well...");
			break;
			
	case "debug_sign_burger":
		scr_text("");
		scr_text("Would you like a burger?");
				scr_option("Yes", "debug_sign_burger - yes");
				scr_option("No", "debug_sign_burger - no");
		break;
		case "debug_sign_burger - yes":
			obj_item_manager.item_give(global.item_list.burger);
			scr_text("Here you go.");
			scr_text("*Burger has been added to your inventory*");
			scr_text("Have fun.");
			break;
		case "debug_sign_burger - no":
			scr_text("Oh well...");
			break;
	
	case "item_get":
		scr_text("You got an item!!");
		break;
		
	case "debug_sign_battle":
		scr_text("");
		scr_text("Walk around in the checkered area to start a battle.");
		break;	
		
		
		
		
		
		
		
		
		
		
		
		
	}
}