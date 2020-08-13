-- AI_KingCrab.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "crako_wait.frm",
        Func    = "KingCrab_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "KingCrab_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 330,
                AIFunc              = "KingCrab_Check_ReleaseTarget",
                DelayFrame          = 550,
            },           

            -- 근접공격
            {
                AICheckFrame        = 110,
                AIFunc              = "KingCrab_Check_Attack01",
                DelayFrame          = 100,
            },

            -- 낙석 공격
            {
                AICheckFrame        = 400,
                AIFunc              = "KingCrab_Check_Attack02",
                DelayFrame          = 165,
            },

            -- 게거품
            {
                AICheckFrame        = 40,
                AIFunc              = "KingCrab_Check_Attack03",
                DelayFrame          = 20,
            },

            -- 돌격
            {
                AICheckFrame        = 250,
                AIFunc              = "KingCrab_Check_Attack05",
                DelayFrame          = 200,
            },
        },
    },
    
    -- 대기
    {
        ID      = "UPWAIT",
        Motion  = "crako_Earthquake_Pounding_B.frm",
        Func    = "KingCrab_UpWaitFunc",

        Trigger =
        {
			{
                AICheckFrame        = 250,
                AIFunc              = "KingCrab_Check_TargetingUpWait",
                DelayFrame          = 300,
            },
            
        },
    },

    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "crako_punch.frm",
        Func    = "KingCrab_Attack01Func",
    },
    
    -- 낙석
    {
        ID      = "ATTACK02",
        Motion  = "crako_Earthquake_Pounding_A.frm",
        Func    = "KingCrab_Attack2Func",
    },
    
    -- 게거품
    {
        ID      = "ATTACK03",
        Motion  = "crako_bubble.frm",
        Func    = "KingCrab_Attack3Func",
    },
    
    -- 몸통 찍기
    {
        ID      = "ATTACK04",
        Motion  = "crako_Earthquake_Pounding_C.frm",
        Func    = "KingCrab_Attack4Func",
    },

    -- 몸통 박치기
    {
        ID      = "ATTACK05",
        Motion  = "crako_bodyAttack.frm",
        Func    = "KingCrab_Attack5Func",
    },
        
        -- 죽기
    {
        ID      = "DIE",
        Motion  = "crako_dead.frm",
        Func    = "KingCrab_DieFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "crako_wait.frm",
        Func    = "KingCrab_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "crako_wait.frm",
        Func    = "KingCrab_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "crako_wait.frm",
		Func	= "KingCrab_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnKingCrab_Land",
    Die     = "OnKingCrab_Die",
    Damage  = "OnKingCrab_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKingCrab( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )    

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KingCrab_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 3 ) then
        g_kCamera.WideMode = 7
    end
    if( pMonster:GetIsRight() ) then
        pMonster:SetSpeedX( -0.01 )    
    else
        pMonster:SetSpeedX( 0.01 )    
    end          
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )          
    end
end

-- 대기 상태
function KingCrab_UpWaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetSuperArmor(true)
    if( pMonster:GetIsRight() ) then
        pMonster:SetSpeedX( -0.01 )    
    else
        pMonster:SetSpeedX( 0.01 )    
    end    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "UPWAIT" )  
    end
    
end



-- 죽는상태
function KingCrab_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

        
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetFly( false )
	elseif( iFrame == 5 ) then        
	    pMonster:PlaySound(1223)      
	
	elseif( iFrame >= pMonster:GetLastFrame() ) then        
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )    
    end
end

-- 데미지 입은거
function KingCrab_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function KingCrab_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 8 ) then                
        pMonster:SkillReadyEffect( 0,0,255, 0.5 )
    elseif( iFrame == 16 ) then       
        pMonster:SetDrawSlash( 1, true )
         
    elseif( iFrame == 27 ) then   
        pMonster:PlaySound(341)   
        pMonster:StartAttack( 7 , PAR_DOWN, 0.06, 21,25 , 17 )
        
    elseif( iFrame == 40 ) then             
        pMonster:CameraVib( 0, 0.5, 0.2 )
        
    elseif( iFrame == 46 ) then        
        pMonster:SetDrawSlash( 1, false )    
        
    elseif( iFrame == 53 ) then 
        --pMonster:SkillReadyEffect( 0,0,255, 0.5 )
        pMonster:SetDrawSlash( 0, true )      
        
    elseif( iFrame == 54 ) then         
        pMonster:PlaySound(341)    
    elseif( iFrame == 59 ) then         
        pMonster:StartAttack( 7 , PAR_DOWN, 0.06, 28,29 , 12 )
        
    elseif( iFrame == 70 ) then             
        pMonster:CameraVib( 0, 0.5, 0.2 )
    elseif( iFrame == 76 ) then        
        pMonster:SetDrawSlash( 0, false )
    end
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
    
    if( iFrame > 39 and iFrame < 45 ) then            
        pMonster:AddTraceParticleToBone( "BangUl_Crap_01", 0, 24 )
        
    elseif( iFrame > 64 and iFrame < 68 ) then
        pMonster:AddTraceParticleToBone( "BangUl_Crap_02", 0, 29 )
    end
    
    
end


function KingCrab_Attack2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "UPWAIT" )
    end
    if( iFrame == 61 ) then    
        pMonster:StartText( "DANGER" )    
        pMonster:PlaySound( "129" )
    elseif( iFrame == 71 ) then    
        pMonster:SkillReadyEffect( 0,0,255, 0.5 )
    elseif( iFrame == 80 ) then    
        pMonster:SetDrawSlash( 1, true )
        pMonster:SetDrawSlash( 0, true )        
        pMonster:SetPushBoundBox( 580, 220 )
    elseif( iFrame == 88 ) then       
        --pMonster:StartAttack( 4 , PAR_DOWN, 0.2, 23,25 , 12 )
        --pMonster:StartAttack( 4 , PAR_DOWN, 0.2, 28,29 , 12 )
        pMonster:PlaySound( "47" )
    elseif( iFrame == 100 ) then        
        pMonster:SetDrawSlash( 0, false )
        pMonster:SetDrawSlash( 1, false )
        pMonster:CameraVib( 1, 1.2, 0.01 )        
    end
    
	if( iFrame == 70 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 3.20, 1.7)
        pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 1.40, 1.7)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 0.50, 1.9)
	elseif( iFrame == 95 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 1.40, 1.7)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 1.00, 1.8)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 2.80, 1.9)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 1.60, 2.0)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 0.20, 2.1)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 0.80, 2.2)	
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 1.76, 2.3)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 0.90, 2.4)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 2.20, 2.5)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 3.40, 2.6)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 3.80, 2.7)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 3.00, 2.7)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 4.00, 2.7)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 0.00, 2.8)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 2.40, 2.9)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 2.00, 3.0)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 0.50, 3.1)
		pMonster:AddDamageWithLocate( DT_MONSTER_CRAB_STONE, 2.20, 3.2)
    end
    
    
    if( iFrame == 95 ) then            
        pMonster:PlaySound( 101 )
    end
    if( iFrame > 100 and iFrame < 103 ) then            
        pMonster:AddTraceParticleToBone( "BangUl_Crap_01", 0, 24 )            
        pMonster:AddTraceParticleToBone( "BangUl_Crap_02", 0, 29 )
    end
    
end

function KingCrab_Attack3Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 103 ) then
        pMonster:AddTraceParticleToBone( "Crap_Foam_Start_01", 0, 6 )
        pMonster:AddTraceParticleToBone( "Crap_Foam_Start_02", 0, 6 )            
    elseif( iFrame == 153 ) then    
        pMonster:AddDamage( DT_MONSTER_CRAB_BUBBLE )
    end
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end




function KingCrab_Attack4Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 12 ) then
        pMonster:StartAttack( 9, PAR_DOWN, 0.4, 2, 6, 6 )
        pMonster:PlaySound( "47" )
        pMonster:AddParticle( "Water_Shock_Wave_01", 0.5, 0.06 )
        pMonster:AddParticle( "Water_Shock_Wave_02", 0.5, 0.06 )
    elseif( iFrame == 16 ) then
        pMonster:CameraVib( 1, 3, 0.2 )
    end
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushBoundBox( 580, 650 )
        pMonster:SetState( "WAIT" )
    end
end


function KingCrab_Attack5Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
        pMonster:SetInvincible( true )
        pMonster:SetCountValue(0)
    
    elseif( iFrame == 42 ) then
        pMonster:CameraVib( 1, 1.5, 0.02 )
        pMonster:StartText( "DANGER" )
        pMonster:PlaySound( "129" )
    elseif( iFrame == 90 ) then    
        pMonster:CameraVib( 1, 1.5, 0.02 )    
        
    elseif( iFrame == 112 ) then
        pMonster:SetPushBoundBox( 580, 220 )
        pMonster:SetDrawSlash( 1, true )
        pMonster:SetDrawSlash( 0, true )   
        
        if( pMonster:GetIsRight() ) then
            pMonster:SetSpeedX( 0.1 )
        else
            pMonster:SetSpeedX( -0.1 )
        end
    elseif( iFrame == 109 ) then    
        pMonster:AddDamage( DT_MONSTER_CRAB_CHARGE ) 
    elseif( iFrame == 131 ) then        
        pMonster:PlaySound(341)              
    end
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetDrawSlash( 1, false )
        pMonster:SetDrawSlash( 0, false )
        pMonster:SetIsRight( not pMonster:GetIsRight() )
        pMonster:SetPushBoundBox( 580, 650 )
        pMonster:SetState( "WAIT" )        
    end
    
    if( iFrame > 50 and iFrame <= pMonster:GetLastFrame() ) then
        if( iFrame % 5 == 0 ) then
            pMonster:AddTraceParticleToBone( "BangUl_Crap_02", 0, 13 )
            pMonster:AddTraceParticleToBone( "BangUl_Crap_02", 0, 37 )
            pMonster:AddTraceParticleToBone( "BangUl_Crap_02", 0, 40 )            
        end
    end
    
    if( iFrame > 35 and iFrame < 65 ) then
        if( iFrame % 18 == 0 ) then
            pMonster:PlaySound( 49 ) 
        end       
    end
    
    
    if( iFrame > 65 and iFrame < 80 ) then
        if( iFrame % 15 == 0 ) then
            pMonster:PlaySound( 49 ) 
        end       
    end
    
    
    if( iFrame > 80 and iFrame <= 150 ) then
        if( iFrame % 8 == 0 ) then
            pMonster:PlaySound( 49 ) 
        end       
    end
    
    
end


--  스톤커스 걸렸음
function KingCrab_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function KingCrab_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end


-- 홀드 걸렸음(이펙트)
function KingCrab_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function KingCrab_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( pMonster:SetTarget( 0, -4000, 2000, 4000, -1000 ) == true ) then    	
        pMonster:ResetDelay()
    end
end


function KingCrab_Check_TargetingUpWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetState( "ATTACK04" )
  
end


function KingCrab_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end


function KingCrab_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 640, -360, 550, 360, -200 ) == true ) then
		
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function KingCrab_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    pMonster:SetState( "ATTACK02" )
	
end

function KingCrab_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    if( pMonster:CheckTargetInRange( 0, -350, 1570, 350, -1000 ) and pMonster:GetCountValue() == 0 ) then
		pMonster:SetCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function KingCrab_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKingCrab_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnKingCrab_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "DIE" )
	end
	
end

function OnKingCrab_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	pMonster:SetPushCheck( true )
	
end

function KingCrab_IdleMoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetIsContact() == true )then		
        if( pMonster:GetIsRight() == true ) then
            pMonster:SetIsRight( false )
            
        else
            pMonster:SetIsRight( true )
            
        end    
        
        pMonster:SetState( "IDLE" )		
	end
end
