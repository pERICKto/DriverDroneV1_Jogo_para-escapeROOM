if (rm_check == 0)
{
    // transição ou sala não mapeada -> não desenha nada
}
else if (analise)
{
    // encostando no bunker -> tem prioridade sobre o texto geral
    var _string;
    if (global.terra == global.valid_terra)
    {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAmostra aparenta ser... [delay]\nMinha nossa, isso é solo fértil?  [delay]\n[c_yellow]NÓS CONSEGUIMOS!\!...\n [delay,1500] "
	   }
	else if (global.air == global.valid_air)
	{
		 _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra correta!";
	}
	else if (global.water == global.valid_water)
	{
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra correta!";
	}
    else if (global.terra != "")
    {
		global.erro = true; //pra mudar o sprite da hud
	    if (global.terra == 2) //piadinha com potassio (KKKK) //atualizado com minigame novo, mudar cores depois
	   {
	   _string = "[scale,0.7][c_green]Analisando amostra...[delay] \... ... ... [delay][c_yellow]\npotassio, potassio, potassio  [delay]\né serio isso? \n muito engraçadinho!\ncolete solo!...\n [delay,1500] "
	   }	   
	   else if (global.terra == 3)// vidro, preciso testar e preciso mudar cores
	   {
	   _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nIsso é vidro? completa... [delay]\nonde voce conseguiu encontrar[delay]\n[c_yellow]isso?\ncolete solo!...\n [delay,1500] "
	   }
	   else if (global.terra == 4)//atualizado com minigame novo, precisa de testes, preciso mudar cores
	   {
	   _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]TAMPINHAS DE CARRAFA???\n Nós não usamos isso a décadas!\n colete solo! [delay,1500] "
	   }
	   else if (global.terra == 5)// ver cores
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]restos de pinheiro\nnão parece ser util...\n [delay,1500] "
	   }
	   else if (global.terra == 6) //atualizado, vou mudar nn, isso ficou mt bom kkkk
	   {
	   _string = "[scale,0.7][c_green]porque voce trouxe isso???\nagora o laboratorio fede\nmelhor trocar o piloto!\n [delay,1500] "
	   }
	}
	else if (global.air != "")
	{
		global.erro = true; //pra mudar o sprite da hud
       if (global.air == 2)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]restos de pinheiro\nnão parece ser util...\n [delay,1500] "
	   }
	   else if (global.air == 3)
	   {
	   _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]apenas um pouco de mato\nnão parece ser util!...\n [delay,1500] "
	   }
	   else if (global.air == 4)
	   {
	   _string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]uma espada-de-são-jorge\nsurpreendente...\nmas não muito util... [delay,1500] "
	   }
	   else if (global.air == 5)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]plantas secas\nprecisamos de algo vivo!...\n [delay,1500] "
	   }
	   else if (global.air == 6)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra aparenta ser ...  [delay]\n[c_yellow]restos vegetais em decomposição\nutil mas ainda não é isso!...\n [delay,1500] "
	   }
	}
	else if (global.water != "")
	{
		global.erro = true; //pra mudar o sprite da hud
       if (global.water == 2)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra vazia...[delay]\n[c_yellow]tente outra...\n [delay,1500] "
	   }
	   else if (global.water == 3)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra vazia...[delay]\n[c_yellow]tente outra...\n [delay,1500] "
	   }
	   else if (global.water == 4)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra vazia...[delay]\n[c_yellow]tente outra...\n [delay,1500] "
	   }
	   else if (global.water == 5)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nAmostra vazia...[delay]\n[c_yellow]tente outra...\n [delay,1500] "
	   }
	   else if (global.water == 6)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nisso so são pedras[delay]\n[c_yellow]precisamos de agua...\n [delay,1500] "
	   }
	   else if (global.water == 7)
	   {
		_string = "[scale,0.7][c_green]Analisando amostra...[delay] \nAnalise completa... [delay]\nisso so são pedras[delay]\n[c_yellow]precisamos de agua...\n [delay,1500] "
	   }
	}
	else if (global.valid > 0)
	{
		_string = "[scale,0.7][c_green]Analisando drone...[delay] \nAmostras analisadas:\n" + string(global.valid) + "\n [delay] [delay] [delay] [delay]";
	}
	
    else
    {
        _string = "[scale,0.7][c_green]Analisando drone...[delay] \nAmostras faltando:\n[delay][c_yellow]3\ncarregando drone... ";
    }

    if (_string != amostra_cache)
    {
        amostra_cache = _string;
        texto_amostra = scribble(_string);
        typist_amostra.in(0.45, 0); // reinicia a digitação só quando a mensagem muda
    }
	
    texto_amostra.draw(552, 515, typist_amostra);
	global.lendo = (typist_amostra.get_state() != 1); // trava enquanto não terminou de digitar

	if (typist_amostra.get_state() = 1) //reseta o erro pra hud voltar ao normal
	{
    global.erro = false;
	}
}
else if (rm_check == 2)
{
    var _string = "[scale,0.7][c_green]local atual: [/c]\n[c_yellow]bunker[/c]\n[c_green]analises:[/c]\n[c_yellow]" + string(global.valid);

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }
	texto_info.draw(552, 515, typist);
}
else if (rm_check == 1)
{
    var _string = "[scale,0.7][c_green]local atual:\n[c_yellow]centro de geologia[/c]\n[c_green]objetivo: [/c][delay]\n[c_yellow]analisar possiveis amostras\nlevar para o bunker[/c]";

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }

    texto_info.draw(552, 515, typist);
}
else if (rm_check == 3)
{
    var _string = "[scale,0.7][c_green]local atual:\n[c_yellow]Jardim principal[/c]\n[c_green]objetivo: [/c][delay]\n[c_yellow]encontar planta adequada\nlevar amostra para o bunker";

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }
	texto_info.draw(552, 515, typist);
}
else if (rm_check == 4)
{
    var _string = "[scale,0.7][c_green]local atual:\n[c_yellow]reservatorios de analise[/c]\n[c_green]objetivo: [/c][delay]\n[c_yellow]checar o nivel de agua\nlevar agua para o bunker";

    if (_string != info_cache)
    {
        info_cache = _string;
        texto_info = scribble(_string);
    }
	texto_info.draw(552, 515, typist);
}