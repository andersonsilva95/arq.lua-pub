-- AI_Vanesa.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Vanesa_Wait.frm",
        Func    = "Vanesa_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "Vanesa_Check_TurnToTarget",
                DelayFrame          = 15,
            },
            -- 달리기
            {
                AICheckFrame        = 55,
                AIFunc              = "Vanesa_Check_Run",
                DelayFrame          = 75,
            },
            -- 근접공격
            {
                AICheckFrame        = 35,
                AIFunc              = "Vanesa_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 소울 임팩트 
            {
                AICheckFrame        = 80,
                AIFunc              = "Vanesa_Check_Attack02",
                DelayFrame          = 55,
            },            
            -- 꽃 뿌리기 
            {
                AICheckFrame        = 55,
                AIFunc              = "Vanesa_Check_Attack03",
                DelayFrame          = 55,
            },                        
			-- 점프업
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Check_JumpUp",
                DelayFrame          = 25,
            },        
            -- 점프다운
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Check_JumpDown",
                DelayFrame          = 25,
            },

            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "Vanesa_Check_Walk",
                DelayFrame          = 55,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Vanesa_Run.frm",
        Func    = "Vanesa_WalkFunc",                 
        EnableMoveCheck = 1,
        MoveFailFunc    = "Vanesa_MoveFail",


        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- 근접공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Vanesa_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 달리기
            {
                AICheckFrame        = 10,
                AIFunc              = "Vanesa_Check_Run",
                DelayFrame          = 55,
            },
            -- 점프업
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Check_JumpUp",
                DelayFrame          = 25,
            },        
            -- 점프다운
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Check_JumpDown",
                DelayFrame          = 25,
            },
        }
    },
    
    --  달리기
    {
        ID      = "RUN",
        Motion  = "Vanesa_Run.frm",
        Func    = "Vanesa_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Vanesa_MoveFail",


        Trigger =
        {
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 35,
                AIFunc              = "Vanesa_Check_TurnToTarget",
                DelayFrame          = 35,
            },
			 -- 근접공격01
            {
                AICheckFrame        = 1,
                AIFunc              = "Vanesa_Check_Attack01",
                DelayFrame          = 55,
            },            
			 -- 소울 임팩트 
            {
                AICheckFrame        = 30,
                AIFunc              = "Vanesa_Check_Attack02",
                DelayFrame          = 600,
            },            
             -- 점프업
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Check_JumpUp",
                DelayFrame          = 25,
            },            
            -- 점프다운
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Check_JumpDown",
                DelayFrame          = 25,
            },		
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Vanesa_Check_RunStop",
                DelayFrame          = 55,
            },            
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Vanesa_Attack01.frm",
        Func    = "Vanesa_Attack01Func",
    },
    
    -- 근접공격02
    {
        ID      = "ATTACK02",
        Motion  = "Vanesa_Attack02.frm",
        Func    = "Vanesa_Attack02Func",
    },
    
    -- 씨앗 뿌리기
    {
        ID      = "ATTACK03",
        Motion  = "Vanesa_Attack03.frm",
        Func    = "Vanesa_Attack03Func",
    },
    
    -- 스크류드랍
    {
        ID      = "ATTACK04READY",
        Motion  = "Vanesa_Attack04a.frm",
        Func    = "Vanesa_Attack04Ready_Func",
    },
	{
        ID      = "ATTACK04GO",
        Motion  = "Vanesa_Attack04b.frm",
        Func    = "Vanesa_Attack04Go_Func",
    },
    {
        ID      = "ATTACK04WAIT",
        Motion  = "Vanesa_Attack04c.frm",
        Func    = "Vanesa_Attack04Wait_Func",
    },

     -- 기상공격
    {
        ID      = "STANDUPATTACK",
        Motion  = "Vanesa_StandUpAttack.frm",
        Func    = "Vanesa_StandUpAttackFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Vanesa_Jump.frm",
        Func    = "Vanesa_JumpFunc",
		
        Trigger =
        {
			--점프공격
            {
                AICheckFrame        = 1,
                AIFunc              = "Vanesa_Check_JumpAttack",
                DelayFrame          = 1,
            },
        }
    },

    -- 점프공격
    {
        ID      = "JUMPATTACK",
        Motion  = "Vanesa_JumpAttack.frm",
        Func    = "Vanesa_JumpAttackFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Vanesa_Damage_Up.frm",
        Func    = "Vanesa_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Vanesa_Damage_Down.frm",
        Func    = "Vanesa_DamageFunc",
    },
    
    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "Vanesa_Down_Up01.frm",
        Func    = "Vanesa_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Vanesa_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Vanesa_Down_Up02.frm",
        Func    = "Vanesa_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Vanesa_Down_Up03.frm",
        Func    = "Vanesa_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Vanesa_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Vanesa_Down_Middle.frm",
        Func    = "Vanesa_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Vanesa_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
	-- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "Vanesa_Down_Middle.frm",
        Func    = "Vanesa_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Vanesa_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Vanesa_Down_Special01.frm",
        Func    = "Vanesa_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Vanesa_Down_Special02.frm",
        Func    = "Vanesa_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Vanesa_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Vanesa_Standup.frm",
        Func    = "Vanesa_StandUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Vanesa_Die01.frm",
        Func    = "Vanesa_DieFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE_LANDING",
        Motion  = "Vanesa_Die02.frm",
        Func    = "Vanesa_DieFunc",
    },
    
   
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Vanesa_Stone.frm",
        Func    = "Vanesa_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Vanesa_Stone.frm",
        Func    = "Vanesa_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Vanesa_Stone.frm",
		Func	= "Vanesa_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnVanesa_Land",
    Die     = "OnVanesa_Die",
    Damage  = "OnVanesa_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitVanesa( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Vanesa_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        if(pMonster:IsSuperArmor() == true) then
            pMonster:SetSuperArmor( false )
		end
		
        pMonster:SetState( "WAIT" )   
		
    end
    

end

-- 걷기 상태
function Vanesa_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 달리기 상태
function Vanesa_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- 죽는상태
function Vanesa_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
		pMonster:PlaySound("607", 0)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
		pMonster:SetFrameLock( true )
        --pMonster:SetState( "WAIT" )
    end
end

-- 데미지 입은거
function Vanesa_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1 ) then
	pMonster:PlaySound(606)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Vanesa_DownUp01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Vanesa_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운
function Vanesa_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 5 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end 
    end
end

-- 다운 스페셜
function Vanesa_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Vanesa_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )	
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end 	
    end
end

-- 일어나기
function Vanesa_StandUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 31 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.008 )
		else
			pMonster:SetSpeedX( -0.008 )
		end	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  근접공격01 상태
function Vanesa_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if(iFrame == 1) then
	pMonster:SetSuperArmor(true)

    elseif( iFrame == 36 ) then
		pMonster:AddDamage( DT_VANESSA_ATK1_1 )
		pMonster:PlaySound(602)
	elseif( iFrame == 56 ) then
		pMonster:AddDamage( DT_VANESSA_ATK1_2 )
		pMonster:PlaySound(602)
	elseif( iFrame == 81 ) then
		pMonster:AddDamage( DT_VANESSA_ATK1_3 )
		pMonster:PlaySound(603)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격02 상태
function Vanesa_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
     if( iFrame <= 1 ) then
        pMonster:SetSpeedX( 0.0)
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound(604)
    elseif( iFrame == 21 ) then
        pMonster:AddParticle( "dark-amon_effect01", 0.0, 0.5 )
        pMonster:AddParticle( "dark-amon_effect02", 0.0, 0.5 )
        pMonster:AddParticle( "dark-amon_effect03", 0.0, 0.5 )
	    pMonster:PlaySound(424)
	
    elseif( iFrame == 31 ) then        
        pMonster:AddParticle( "dark-amon_effect05", 0.0, 0.4 )
        pMonster:AddParticle( "dark-amon_effect06", 0.0, 0.4 )
        pMonster:AddParticle( "dark-amon_effect07", 0.0, 0.4 )
    elseif( iFrame == 36 ) then
		pMonster:AddParticle( "dark-amon_effect04", 0.0, 0.5 )
        pMonster:AddParticle( "dark-amon_effect08", 0.0, 0.5 )
        pMonster:AddParticle( "dark-amon_effect09", 0.0, 0.5 )
        pMonster:AddParticle( "dark-amon_effect10", 0.0, 0.5 )

	elseif( iFrame == 51)  then
	     pMonster:AddDamage( DT_VANESSA_ATK2 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
    end
end

-- 씨앗 뿌리기
function Vanesa_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:PlaySound(605)
	elseif( iFrame == 34 ) then
		pMonster:AddDamage(DT_VANESSA_ATK3)
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetState( "WAIT" )
    end
end

-- 공중 공격 준비 자세 
function Vanesa_Attack04Ready_Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
    	pMonster.fReserveValue=45
		pMonster:SetFly(TRUE)
    elseif( iFrame == 7 ) then
         	pMonster:PlaySound(247)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK04GO" )
    end
end
-- 공중 공격 자세 
function Vanesa_Attack04Go_Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
    	 pMonster:SetSpeedX(pMonster:GetWalkSpeed()/5*8)
		 pMonster:SetSpeedY(-0.04)
		 
    elseif( iFrame == 4 ) then
        pMonster:AddDamage( DT_VANESSA_ATK4 )
    elseif( iFrame == 11 ) then
        pMonster:AddDamage( DT_VANESSA_ATK4 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
    	
         if(pMonster.fReserveValue > 0 ) then 
		 	  pMonster.fReserveValue = pMonster.fReserveValue-iFrame
			  pMonster:SetState("ATTACK04GO")
		 	 
		 else
			 pMonster:SetState( "ATTACK04WAIT" )    	 	
    	 end
	end
	
	if( pMonster:IsLastBottom() == true ) then
	    pMonster:SetState( "ATTACK04WAIT" )    	 	
    end
end

--  공중 공격 착지 상태
function Vanesa_Attack04Wait_Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 )then
    	print("그만좀 날아!!!") 
    	print(pMonster:GetFly())
		pMonster:SetFly(false)
		print(pMonster:GetFly())
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  기상공격
function Vanesa_StandUpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 )then
		pMonster:SetInvincible( true )
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(603)
		
    elseif( iFrame == 10 ) then
		pMonster:AddDamage( DT_VANESSA_STAND_UP_ATK )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프이동 상태
function Vanesa_JumpMoveFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 )then
		pMonster:SetPushCheck( true )
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프이동공격 상태
function Vanesa_JumpMoveAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 7 ) then 
		pMonster:AddDamageWithAngle( DT_MONSTER_Vanesa03, -1.3 )
	elseif( iFrame == 8 ) then 
		pMonster:AddDamageWithAngle( DT_MONSTER_Vanesa03, -1.7 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Vanesa_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프공격 상태
function Vanesa_JumpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 4 ) then 
		pMonster:PlaySound(603)
		pMonster:AddDamage( DT_VANESSA_ATK5 )
	elseif( iFrame == 13 ) then 
		pMonster:PlaySound(603)
		pMonster:AddDamage( DT_VANESSA_ATK5 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  회피 상태
function Vanesa_AvoidFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then	
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
		pMonster:Turn()		
    end
end

--  석화 상태
function Vanesa_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame == 150 ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function Vanesa_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
	elseif( iFrame == 150 ) then
		pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then        
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end


-- 홀드 걸렸음(이펙트)
function Vanesa_HoldFunc( iMonsterIndex, iFrame )
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

function Vanesa_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1024, 800, 1024, -800 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Vanesa_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Vanesa_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -100, 200, 100, -200 ) == false ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "WALK" )
            pMonster:ResetDelay()
    end
end

function Vanesa_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 350, -250, 200, 250, -100 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "RUN" )
        pMonster:ResetDelay()
    end
end

function Vanesa_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 320, -300, 800, 300, -800 ) == false ) then
		pMonster:SetState( "WAIT" )			
		pMonster:ResetDelay()
    end
end

function Vanesa_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Vanesa_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 100, 100, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Vanesa_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 100, 150, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Vanesa_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -100, 150, 100, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Vanesa_Check_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( iFrame > 10 and pMonster:GetSpeedY() > 0 and pMonster:CheckTargetInRange( 100, -100, 100, 100, -100 ) == true ) then
		pMonster:SetState( "JUMPATTACK" )
		pMonster:ResetDelay()
	elseif( iFrame > 10 and pMonster:GetSpeedY() < 0 ) then
		if( pMonster:CheckTargetInRange( 300, -150, -150, 150, -300 ) == true or pMonster:CheckTargetInRange( 100, -100, 0, 100, -150 ) == true ) then
			pMonster:SetState( "ATTACK04READY" )
			pMonster:ResetDelay()
		end
    end
end

function Vanesa_Check_JumpMove( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 400, -200, 100, 200, -100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetNoCheckContact(50)
		pMonster:SetState( "JUMPMOVE" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
		pMonster:SetSpeedY( 0.040 )			
		pMonster:ResetDelay()
	end
end

function Vanesa_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true ) then
		Vanesa_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Vanesa_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 60, -100, -40, 100, -600 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Vanesa_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 0, -200, 150, 200, -100 ) == true ) then
			pMonster:SetState( "STANDUPATTACK" )
		else
			pMonster:SetState( "STANDUP" )
		end	
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnVanesa_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPATTACK" ) == true or pMonster:CheckState( "JUMPMOVE" ) == true or pMonster:CheckState( "JUMPMOVEATTACK" ) == true or pMonster:CheckState( "AERIALAVOID" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "ATTACK04" ) == true ) then
		pMonster:SetState( "ATTACK04_LANDING" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnVanesa_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
	
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end	
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnVanesa_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    print ( "asfasfsa" )
 	pMonster:SetPushCheck( true )

	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
	
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		pMonster:SetNoCheckContact( 25 )
		--pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.03 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )				
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			if( pMonster:GetIsRight() == true) then
				pMonster:SetSpeedX( -0.03 )			
			else
				pMonster:SetSpeedX( 0.03 )			
			end
			pMonster:SetNoCheckContact( 5 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	
	end

    if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if( pMonster:FloatRand() < 0.15 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			if( pMonster:FloatRand() < 0.4  )then
				pMonster:TurnToTarget()	
				pMonster:SetState( "ATTACK02" )
				pMonster:SetSuperArmor(true)
			elseif( pMonster:CheckTargetInRange( 0, -300, 300, 300, -300 ) == false ) then
				Vanesa_Process_Jump( iMonsterIndex )
				pMonster:SetState( "JUMP" )
				pMonster:SetSuperArmor(true)
			elseif( pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
				pMonster:TurnToTarget()	
				pMonster:SetState( "ATTACK01" )
				pMonster:SetSuperArmor(true)
			end
		end
    end
	
	pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
end

function Vanesa_Process_Jump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    --pMonster:SetPushCheck( false )

	pMonster:TurnToTarget()
	
	pMonster:SetNoCheckContact( 40 )

	iTargetX = pMonster:GetTargetX()
	iTargetY = pMonster:GetTargetY()
	iX       = pMonster:GetX()
	iY       = pMonster:GetY()

	pMonster:SetSpeedX( ( iTargetX - iX ) / 80.0 )

	if( iTargetY - iY >= -0.25 ) and ( iTargetY - iY < 0.25 ) then
		pMonster:SetSpeedY( 0.05 )   -- 동일 y선상에 있을때 이정도가 적당..
	elseif( iTargetY - iY >= 0.25 ) and ( iTargetY - iY < 0.5 ) then
		pMonster:SetSpeedY( 0.056 )   -- 타겟이 조금 높은곳에 있으면..
	elseif( iTargetY - iY >= -0.5 ) and ( iTargetY - iY < -0.25 ) then
		pMonster:SetSpeedY( 0.047 )    -- 타겟이 조금 낮은곳에 있으면..
	elseif( iTargetY - iY >= 0.5 ) then
		pMonster:SetSpeedY( 0.056 )
	elseif( iTargetY - iY < -0.5 ) then
		pMonster:SetSpeedY( 0.041 )
	end
end

function Vanesa_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.7) + pMonster:FloatAbs((fSpeedX / 2.9)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Vanesa_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.5 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(20)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.5 )
			pMonster:SetSpeedY( 0.018)			
		end
	end
end
