kongInit();

if(kongGetAPI()){
    kongSubmitStat("game_conplete", 0);
    kongSubmitStat("score", 0);
    kongSubmitStat("rooms_explored", 0);
}
