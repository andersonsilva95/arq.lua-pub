-- AI_Nessi.lua

ActionList =
{


    -- 대기
    {
        ID      = "WAIT",
        Motion  = "swamp_nessi_boss_wait.frm",
        Func    = "Nessi_WaitFunc",       
        
        Trigger =
        {               
			-- 타게팅
            {
                AICheckFrame        = 70,
                AIFunc              = "Nessi_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 물기
            {
                AICheckFrame        = 90,
                AIFunc              = "Nessi_Check_Attack01",
                DelayFrame          = 100,
            },
            --브레스
            {
                AICheckFrame        = 100,
                AIFunc              = "Nessi_Check_Attack02",
                DelayFrame          = 100,
            },
            
            --브레스
            {
                AICheckFrame        = 70,
                AIFunc              = "Nessi_Check_Attack02_U",
                DelayFrame          = 100,
            },
            
            --지진
            {
                AICheckFrame        = 250,
                AIFunc              = "Nessi_Check_Attack03",
                DelayFrame          = 100,
            },
            
            --브레스
            {
                AICheckFrame        = 155,
                AIFunc              = "Nessi_Check_Attack04U",
                DelayFrame          = 100,
            },
            
            --브레스
            {
                AICheckFrame        = 155,
                AIFunc              = "Nessi_Check_Attack04D",
                DelayFrame          = 100,
            },
            
            --턴
            {
                AICheckFrame        = 125,
                AIFunc              = "Nessi_Check_Attack05",
                DelayFrame          = 200,
            },
            
             --룬 파이어
            {
                AICheckFrame        = 130,
                AIFunc              = "Nessi_Check_Attack07",
                DelayFrame          = 110,
            },
        }
    },
    
    -- 물기
    {
        ID      = "ATTACK01",
        Motion  = "swamp_nessi_boss_bite_attack.frm",
        Func    = "Nessi_Attack01Func",
    },
    
    -- 브레스
    {
        ID      = "ATTACK02",
        Motion  = "swamp_nessi_boss_rune_fireball_front.frm",
        Func    = "Nessi_Attack02Func",
    },
    
    -- 브레스
    {
        ID      = "ATTACK02_U",
        Motion  = "swamp_nessi_boss_rune_fireball_front_up.frm",
        Func    = "Nessi_Attack02_U_Func",
    },
    
    
    
    -- 어스퀘이크
    {
        ID      = "ATTACK03",
        Motion  = "swamp_nessi_boss_earthquake_attack.frm",
        Func    = "Nessi_Attack03Func",
    },
    
    -- 뒤로 브레스
    {
        ID      = "ATTACK04_U",
        Motion  = "swamp_nessi_boss_rune_fireball_back_up.frm",
        Func    = "Nessi_Attack04UFunc",
    },
    
    {
        ID      = "ATTACK04_D",
        Motion  = "swamp_nessi_boss_rune_fireball_back_down.frm",
        Func    = "Nessi_Attack04DFunc",
    },
    
    -- 턴
    {
        ID      = "ATTACK05",
        Motion  = "swamp_nessi_boss_turn_attack.frm",
        Func    = "Nessi_Attack05Func",
    },
    
    -- 등치기
    {
        ID      = "ATTACK06",
        Motion  = "swamp_nessi_boss_back_attack.frm",
        Func    = "Nessi_Attack06Func",
    },
    
    -- 룬 파이어!!
    {
        ID      = "ATTACK07",
        Motion  = "swamp_nessi_boss_rune_energy_attack.frm",
        Func    = "Nessi_Attack07Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "swamp_nessi_boss_die.frm",
        Func    = "Nessi_DieFunc",
    },
}

CallBack =
{
    Land    = "",
    Die     = "OnNessi_Die",
    Damage  = "",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitNessi( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    	
    
    pMonster:SetIsRight( false )

    
    pMonster:AddTraceParticleToBone( "Dragon_Body_01", 1, 13 )
    pMonster:AddTraceParticleToBone( "Dragon_Body_02", 1, 13 )
    
    
    pMonster:AddTraceParticleToBone( "Dragon_Body_01", 1, 14 )
    pMonster:AddTraceParticleToBone( "Dragon_Body_02", 1, 14 )
    
    pMonster:AddTraceParticleToBone( "Dragon_Body_01", 1, 10 )
    pMonster:AddTraceParticleToBone( "Dragon_Body_02", 1, 10 )
    
    pMonster:AddTraceParticleToBone( "Dragon_Body2_01", 1, 34 )
    pMonster:AddTraceParticleToBone( "Dragon_Body2_02", 1, 34 )
    
    
    

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Nessi_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    Nessi_BackGuard( iMonsterIndex, iFrame )                
    
    if( iFrame >= pMonster:GetLastFrame() ) then        
        pMonster:SetState( "WAIT" )                
    end
end

--  물기
function Nessi_Attack01Func( iMonsterIndex, iFrame )
    Nessi_BackGuard( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:PlaySound( 1385 )
    elseif( iFrame == 43 ) then
        pMonster:StartAttack( 5, PAR_DOWN, 0.1, 9, 11, 9 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
       
    end
end

--  드래곤브레스02 상태
function Nessi_Attack02Func( iMonsterIndex, iFrame )
    Nessi_BackGuard( iMonsterIndex, iFrame )
   local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
   
   if( iFrame <= 1 ) then
        pMonster:PlaySound( 1383 )
   elseif( iFrame == 42 ) then   
        local x = 0.2
        local y = 1.25
        pMonster:SkillReadyEffectNoStop( 0,50,200 , y - 0.25 )
        
        pMonster:AddParticle( "Dragon_Charge_01" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_02" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_03" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_04" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_05" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_06" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_07" ,x , y )
   elseif( iFrame >= 62 and iFrame <= 120 ) then
        if( iFrame % 2 == 0 ) then
            -- 불이 삐져나갈 주둥이 위치
            local vMouthPos = pMonster:GetBonePos( 11 )            
            
            -- 나가는 방향을 구하자!!!
            local vBase = pMonster:GetBonePos( 9 )            
            local vEnd = pMonster:GetBonePos( 10 )           
            local fAngle = ( vEnd.x - vBase.x ) / ( vEnd.y - vBase.y )
            fAngle = math.acos( fAngle )
            
            local fOffsetX = 0.10
            
            if( pMonster:GetIsRight() ) then
                fAngle = fAngle + 3.14156
                fOffsetX = - fOffsetX
            end
            
            pMonster:AddDamageWithLocateAngle( 1692, vMouthPos.x - fOffsetX, vMouthPos.y + 0.03 , true, fAngle )
        end
   end
   
   if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  드래곤브레스02 상태
function Nessi_Attack02_U_Func( iMonsterIndex, iFrame )
    Nessi_BackGuard( iMonsterIndex, iFrame )
   local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
   
   if( iFrame <= 1 ) then
        pMonster:PlaySound( 1385 )
   elseif( iFrame == 34 ) then
        local x = 0.16
        local y = 1.30
        pMonster:SkillReadyEffectNoStop( 50,0,200 , y )
        
        pMonster:AddParticle( "Dragon_Charge_01" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_02" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_03" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_04" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_05" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_06" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_07" ,x , y )
   elseif( iFrame >= 48 and iFrame <= 120 ) then
        if( iFrame % 2 == 0 ) then
            -- 불이 삐져나갈 주둥이 위치
            local vMouthPos = pMonster:GetBonePos( 11 )            
            
            -- 나가는 방향을 구하자!!!
            local vBase = pMonster:GetBonePos( 9 )                        
            local vEnd = pMonster:GetBonePos( 10 )           
            local fAngle = ( vEnd.x - vBase.x ) * ( vEnd.y - vBase.y )
            fAngle = math.atan( fAngle )
            
            local fOffsetX = 0.10
            
            if( pMonster:GetIsRight() ) then                
                fOffsetX = - fOffsetX
            end
            
            pMonster:AddDamageWithLocateAngle( 1692, vMouthPos.x - fOffsetX, vMouthPos.y + 0.03 , true, fAngle )
        end
   end
   
   if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end


--  어스퀘이크
function Nessi_Attack03Func( iMonsterIndex, iFrame )
    Nessi_BackGuard( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 1384 )
    elseif( iFrame == 11 ) then    
        pMonster:StartText( "JUMP" )
        
    elseif( iFrame == 37 ) then
		pMonster:EarthQuake( 30, 0.06, 0.03 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


function Nessi_Attack04DFunc( iMonsterIndex, iFrame )
    Nessi_BackGuard( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1 ) then
        pMonster:PlaySound( 1383 )
        
    elseif( iFrame == 45 ) then
        local x = -0.36
        local y = 1.30
        pMonster:SkillReadyEffectNoStop( 0,50,200 , y )
        
        pMonster:AddParticle( "Dragon_Charge_01" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_02" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_03" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_04" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_05" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_06" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_07" ,x , y )
    elseif( iFrame >= 57 and iFrame <= 120 ) then
         if( iFrame % 2 == 0 ) then
            -- 불이 삐져나갈 주둥이 위치
            local vMouthPos = pMonster:GetBonePos( 11 )            
            
            -- 나가는 방향을 구하자!!!
            local vBase = pMonster:GetBonePos( 9 )            
            local vEnd = pMonster:GetBonePos( 10 )           
            
            local fAngle = ( vEnd.x - vBase.x ) / ( vEnd.y - vBase.y )
            fAngle = math.acos( fAngle )
            
            local fOffsetX = 0.10
            
            if( pMonster:GetIsRight() ) then
                fAngle = fAngle + 3.14156
                fOffsetX = - fOffsetX
            end
            
            pMonster:AddDamageWithLocateAngle( 1694, vMouthPos.x + fOffsetX, vMouthPos.y + 0.15 , true, fAngle )
        end    
   end
   
   if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

function Nessi_Attack04UFunc( iMonsterIndex, iFrame )
    Nessi_BackGuard( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1 ) then
        pMonster:PlaySound( 1383 )
    elseif( iFrame == 40 ) then
        local x = -0.20
        local y = 1.25
        pMonster:SkillReadyEffectNoStop( 0,50,200 , y )
        
        pMonster:AddParticle( "Dragon_Charge_01" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_02" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_03" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_04" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_05" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_06" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_07" ,x , y )
    elseif( iFrame >= 57 and iFrame <= 120 ) then
         if( iFrame % 2 == 0 ) then
            -- 불이 삐져나갈 주둥이 위치
            local vMouthPos = pMonster:GetBonePos( 11 )            
            
            -- 나가는 방향을 구하자!!!
            local vBase = pMonster:GetBonePos( 9 )            
            local vEnd = pMonster:GetBonePos( 10 )           
            
            local fAngle = ( vEnd.x - vBase.x ) / ( vEnd.y - vBase.y )
            local fOffsetX = 0.13
            
            if( pMonster:GetIsRight() == true ) then
                fOffsetX = -fOffsetX
            else
                fAngle = fAngle + 3.14156
            end
            
            fAngle = fAngle * 0.5 + 2.2
            pMonster:AddDamageWithLocateAngle( 1694, vMouthPos.x + fOffsetX, vMouthPos.y + 0.15 , true, fAngle )
        end    
   end
   
   if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end


function Nessi_Attack05Func( iMonsterIndex, iFrame )
    Nessi_BackGuard( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        
        for i=0,7 do 
            pMonster:SetPushCheck( false , i )
        end

   elseif( iFrame == 20 ) then
        --pMonster:StartAttack( 5, 16, 0.5, 22, 26, 9 )
        pMonster:AddDamage( 1696 )
        
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:SetIsRight( not pMonster:GetIsRight() )
	    for i=0,7 do 
            pMonster:SetPushCheck( true , i )
        end
	    
        pMonster:SetState( "WAIT" )
    end
end


function Nessi_Attack06Func( iMonsterIndex, iFrame )
    Nessi_BackGuard( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        
        
    elseif( iFrame == 20 ) then
        
	elseif( iFrame >= pMonster:GetLastFrame() ) then	    
	    
        pMonster:SetState( "WAIT" )
    end
end

function Nessi_Attack07Func( iMonsterIndex, iFrame )
    Nessi_BackGuard( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:PlaySound( 1387 )
    elseif( iFrame == 25 ) then        
        local x = 0.0
        local y = 1.0
        pMonster:SkillReadyEffectNoStop( 0,0,0 , y )
        
        pMonster:AddParticle( "Dragon_Charge_01" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_02" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_03" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_04" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_05" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_06" ,x , y )
        pMonster:AddParticle( "Dragon_Charge_07" ,x , y )
    elseif( iFrame == 65 ) then
        pMonster:AddDamage( 1693 )                
    elseif( iFrame == 98 ) then    
        pMonster:PlaySound( 1388 )
    elseif( iFrame == 108 ) then    
        local fAngle = -0.25
        if( pMonster:GetIsRight() ) then
            fAngle = -fAngle 
        end        
        for i=1,25 do 
            pMonster:AddDamageWithLocateAngle( 1691 , 1.5, 3, false , fAngle * i  )        
        end
        
        
	elseif( iFrame >= pMonster:GetLastFrame() ) then	    
	    
        pMonster:SetState( "WAIT" )
    end
end


-- 죽기상태
function Nessi_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 1386 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------


function Nessi_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1400, 800, 1400, -800 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -300 ) == true ) then
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end


function Nessi_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -200, 400, 200, 100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Nessi_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 600, -400, 300, 400, -120 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Nessi_Check_Attack02_U( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 600, -400, 600, 400, 220 ) == true ) then
		pMonster:SetState( "ATTACK02_U" )
		pMonster:ResetDelay()
    end
end

function Nessi_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    
	pMonster:SetState( "ATTACK03" )
	pMonster:ResetDelay()
    
end

function Nessi_Check_Attack04U( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -500, -550, 750, 550, 200 ) == true ) then
		pMonster:SetState( "ATTACK04_U" )
		pMonster:ResetDelay()
    end
end

function Nessi_Check_Attack04D( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -400, -550, 350, 550, -500 ) == true ) then
		pMonster:SetState( "ATTACK04_D" )
		pMonster:ResetDelay()
    end
end

function Nessi_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -400, -550, 350, 550, -500 ) == true ) then
    	pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end



function Nessi_Check_Attack07( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetHP() < pMonster:GetMaxHP() * 0.4 ) then
	    pMonster:SetState( "ATTACK07" ) 
	    pMonster:ResetDelay()
	end
end


function Nessi_BackGuard( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( iFrame % 5 == 1) then
        pMonster:AddDamage( 1695 )
	end
end



-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnNessi_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetState( "DIE" )
	
end

