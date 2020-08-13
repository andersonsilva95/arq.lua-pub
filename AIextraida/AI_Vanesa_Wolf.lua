-- AI_Vanesa.lua
TempVal = 1

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Vanesa_Wolf_Wait.frm",
        Func    = "Vanesa_Wolf_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Wolf_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "Vanesa_Wolf_Check_TurnToTarget",
                DelayFrame          = 15,
            },
            -- 디버프
            {
                AICheckFrame        = 55,
                AIFunc              = "Vanesa_Wolf_Check_Attack01",
                DelayFrame          = 1100,
            },
            -- 근접공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Vanesa_Wolf_Check_Attack02",
                DelayFrame          = 55,
            },
            --돌진공격
            {
                AICheckFrame        = 35,
                AIFunc              = "Vanesa_Wolf_Check_Attack03",
                DelayFrame          = 220,
            },
            -- 점프업
            {
                AICheckFrame        = 45,
                AIFunc              = "Vanesa_Wolf_Check_JumpUp",
                DelayFrame          = 45,
            },        
            -- 점프다운
            {
                AICheckFrame        = 55,
                AIFunc              = "Vanesa_Wolf_Check_JumpDown",
                DelayFrame          = 55,
            },

            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "Vanesa_Wolf_Check_Walk",
                DelayFrame          = 55,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Vanesa_Wolf_Walk.frm",
        Func    = "Vanesa_Wolf_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Vanesa_Wolf_MoveFail",


        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Wolf_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 25,
                AIFunc              = "Vanesa_Wolf_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- 근접공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Vanesa_Wolf_Check_Attack02",
                DelayFrame          = 55,
            },
            --돌진공격
            {
                AICheckFrame        = 35,
                AIFunc              = "Vanesa_Wolf_Check_Attack03",
                DelayFrame          = 330,
            },
            -- 점프업
            {
                AICheckFrame        = 45,
                AIFunc              = "Vanesa_Wolf_Check_JumpUp",
                DelayFrame          = 45,
            },        
            -- 점프다운
            {
                AICheckFrame        = 55,
                AIFunc              = "Vanesa_Wolf_Check_JumpDown",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Vanesa_Wolf_Attack01.frm",
        Func    = "Vanesa_Wolf_Attack01Func",
    },
    -- 근접공격02
    {
        ID      = "ATTACK02",
        Motion  = "Vanesa_Wolf_Attack02.frm",
        Func    = "Vanesa_Wolf_Attack02Func",
    },
    -- 대쉬공격준비 03
    {
        ID      = "ATTACK03",
        Motion  = "Vanesa_Wolf_Attack03_Wait.frm",
        Func    = "Vanesa_Wolf_Attack03Func",
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Vanesa_Wolf_Check_Attack03_Start",
                DelayFrame          = 1,
            },
        }
    },
    -- 대쉬공격 회전 03
    {
        ID      = "ATTACK03ROLL",
        Motion  = "Vanesa_Wolf_Rolling.frm",
        Func    = "Vanesa_Wolf_Attack03RollFunc",
		Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Vanesa_Wolf_Check_Attack03_ROLL",
                DelayFrame          = 1,
            },
        }
    },
	-- 위쪽_대쉬공격시작 03A
    {
        ID      = "ATTACK03A",
        Motion  = "Vanesa_Wolf_Attack03_A.frm",
        Func    = "Vanesa_Wolf_Attack03AFunc",
		IsFallDownMotion    = TRUE,

    },
    -- 위쪽_대쉬공격중간 03A
    {
        ID      = "ATTACK03A_READY",
        Motion  = "Vanesa_Wolf_Attack03_01.frm",
        Func    = "Vanesa_Wolf_Attack03A_ReadyFunc",
		IsFallDownMotion    = TRUE,
	},
    -- 위쪽_대쉬공격마무리 03A
    {
        ID      = "ATTACK03A_END",
        Motion  = "Vanesa_Wolf_Attack03_01_Jump.frm",
        Func    = "Vanesa_Wolf_Attack03_EndFunc",
	    IsFallDownMotion    = TRUE,
    },    
    -- 중간_대쉬공격시작 03B
    {
        ID      = "ATTACK03B",
        Motion  = "Vanesa_Wolf_Attack03_B.frm",
        Func    = "Vanesa_Wolf_Attack03BFunc",
		IsFallDownMotion    = TRUE,
    },
    -- 중간_대쉬공격준비 03B
    {
        ID      = "ATTACK03B_READY",
        Motion  = "Vanesa_Wolf_Attack03_02.frm",
        Func    = "Vanesa_Wolf_Attack03B_ReadyFunc",
		IsFallDownMotion    = TRUE,
    },
    -- 중간_대쉬공격마무리 03B
    {
        ID      = "ATTACK03B_END",
        Motion  = "Vanesa_Wolf_Attack03_02_Wait.frm",
        Func    = "Vanesa_Wolf_Attack03_EndFunc",
		IsFallDownMotion    = TRUE,
    },
    -- 대쉬공격시작 03C
    {
        ID      = "ATTACK03C",
        Motion  = "Vanesa_Wolf_Attack03_C.frm",
        Func    = "Vanesa_Wolf_Attack03CFunc",
		IsFallDownMotion    = TRUE,
    },
    -- 대쉬공격준비 03C
    {
        ID      = "ATTACK03C_READY",
        Motion  = "Vanesa_Wolf_Attack03_03.frm",
        Func    = "Vanesa_Wolf_Attack03C_ReadyFunc",
		IsFallDownMotion    = TRUE,
    },
    -- 대쉬공격마무리 03C
    {
        ID      = "ATTACK03C_END",
        Motion  = "Vanesa_Wolf_Attack03_03_Wait.frm",
        Func    = "Vanesa_Wolf_Attack03_EndFunc",
		IsFallDownMotion    = TRUE,
    },
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Vanesa_Wolf_Jump.frm",
        Func    = "Vanesa_Wolf_JumpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Vanesa_Wolf_Check_JumpAttack",
                DelayFrame          = 1,
            },
        }
    },
    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Vanesa_Wolf_Damage_Up.frm",
        Func    = "Vanesa_Wolf_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Vanesa_Wolf_Damage_Down.frm",
        Func    = "Vanesa_Wolf_DamageFunc",
    },
    
    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "Vanesa_Wolf_Down_Up01.frm",
        Func    = "Vanesa_Wolf_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Vanesa_Wolf_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Vanesa_Wolf_Down_Up02.frm",
        Func    = "Vanesa_Wolf_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Vanesa_Wolf_Down_Up03.frm",
        Func    = "Vanesa_Wolf_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Vanesa_Wolf_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Vanesa_Wolf_Down_Middle.frm",
        Func    = "Vanesa_Wolf_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Vanesa_Wolf_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Vanesa_Wolf_Down_Special01.frm",
        Func    = "Vanesa_Wolf_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Vanesa_Wolf_Down_Special02.frm",
        Func    = "Vanesa_Wolf_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Vanesa_Wolf_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Vanesa_Wolf_StandUp.frm",
        Func    = "Vanesa_Wolf_StandUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Vanesa_Wolf_Die01.frm",
        Func    = "Vanesa_Wolf_DieFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE_LANDING",
        Motion  = "Vanesa_Wolf_Die02.frm",
        Func    = "Vanesa_Wolf_DieFunc",
    },
    
   
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Vanesa_Wolf_Stone.frm",
        Func    = "Vanesa_Wolf_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Vanesa_Wolf_Stone.frm",
        Func    = "Vanesa_Wolf_IceCurseFunc",
    },
    
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Vanesa_Wolf_Stone.frm",
		Func	= "Vanesa_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnVanesa_Wolf_Land",
    Die     = "OnVanesa_Wolf_Die",
    Damage  = "OnVanesa_Wolf_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitVanesa_Wolf( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
       
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Vanesa_Wolf_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end

end

-- 걷기 상태
function Vanesa_Wolf_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end



-- 죽는상태
function Vanesa_Wolf_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
		pMonster:SetFrameLock( true )
        --pMonster:SetState( "WAIT" )
    end
end

-- 데미지 입은거
function Vanesa_Wolf_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Vanesa_Wolf_DownUp01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Vanesa_Wolf_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운
function Vanesa_Wolf_DownFunc( iMonsterIndex, iFrame )
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
function Vanesa_Wolf_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Vanesa_Wolf_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Vanesa_Wolf_StandUpFunc( iMonsterIndex, iFrame )
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

--  근접공격01 상태(디버프 공격)
function Vanesa_Wolf_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local iEndFrame = pMonster:GetLastFrame()
    if(iFrmae==1) then
	    pMonster:SetSuperArmor( true )
    elseif( iFrame > 45 and iFrame < iEndFrame ) then
        pMonster:Fear( false )
        if( iFrame == 70 ) then
            pMonster:Fear( true )
        end
    end
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 46 ) then
		pMonster:PlaySound( "281" )
    elseif( iFrame >= iEndFrame ) then		
        pMonster:SetState( "WAIT" )
    end    
end
--  근접공격02 상태
function Vanesa_Wolf_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    	if( iFrame == 1) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:AddDamage( DT_VANESSA_WOLF_ATK2_1 )
		pMonster:PlaySound(262)
	elseif( iFrame == 43 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:AddDamage( DT_VANESSA_WOLF_ATK2_2 )
		pMonster:PlaySound(262)
	elseif( iFrame == 53 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )	
		pMonster:AddDamage( DT_VANESSA_WOLF_ATK2_3 )
		pMonster:PlaySound(262)
	elseif( iFrame == 68 ) then
	    pMonster:AddDamage( DT_VANESSA_WOLF_ATK2_4 )
		pMonster:PlaySound(262)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
--  근접공격03 상태
function Vanesa_Wolf_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <=1 )  then
		pMonster:SetSuperArmorFrame(pMonster:GetLastFrame() + 5)
    print( iFrame )
	elseif( iFrame >=2 ) then
		pMonster:SetSpeedX(0.0005) 
	end
	if( iFrame == pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK03" )

    end
end

function Vanesa_Wolf_Attack03RollFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if(iFrame == 1) then
       	pMonster:SetSpeedX( 0.0 )
       	pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK03A_END" )
    end
end
--대쉬 공격 03A_Start상태
function Vanesa_Wolf_Attack03AFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if(iFrame == 1) then
	    pMonster:SetFly(TRUE)
		pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.0 )
        pMonster:SetSpeedY( 0.05 )
		pMonster:SetSuperArmor(true)
        pMonster:AddDamageWithAngle( DT_VANESSA_WOLF_ATK3, 0.75 )
		pMonster:PlaySound(247)
        if( pMonster:GetIsRight() == true ) then        
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_03", 1.0 )
        else
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_R_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_R_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_R_03", 1.0 )
            
        end    
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK03ROLL")
	end
	
end

--대쉬 공격 03A_Ready상태
function Vanesa_Wolf_Attack03A_ReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame == 3)   then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.0 )
        pMonster:SetSpeedY( 0.05 )
		pMonster:SetSuperArmorFrame(pMonster:GetLastFrame() + 5)
        pMonster:AddDamageWithAngle( DT_VANESSA_WOLF_ATK3, 0.75 )
		pMonster:PlaySound(247)
        if( pMonster:GetIsRight() == true ) then
        
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_03", 1.0 )
        else
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_R_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_R_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Up_R_03", 1.0 )
            
        end

	elseif( iFrame >= pMonster:GetLastFrame() and pMonster:GetCountValue() <= 0)  then
		pMonster:SetState( "ATTACK03A_END")
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK03ROLL")

    end

end
--대쉬 공격 03b_start상태
function Vanesa_Wolf_Attack03BFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	   if(iFrame == 3) then
        pMonster:SetFly(true)
		pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.0 )
		pMonster:SetSuperArmorFrame(pMonster:GetLastFrame() + 5)
        pMonster:AddDamageWithAngle( DT_VANESSA_WOLF_ATK3 )
		pMonster:PlaySound(247)
        if( pMonster:GetIsRight() == true ) then
        
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_03", 1.0 )
        else
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_R_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_R_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_R_03", 1.0 )
            
        end

	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK03ROLL")
	end
end
--대쉬 공격 03b_ready상태
function Vanesa_Wolf_Attack03B_ReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 3)   then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.0 )
		pMonster:SetSuperArmorFrame(pMonster:GetLastFrame() + 5)
        pMonster:AddDamageWithAngle( DT_VANESSA_WOLF_ATK3 )
		pMonster:PlaySound(247)
        if( pMonster:GetIsRight() == true ) then
        
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_03", 1.0 )
        else
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_R_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_R_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_R_03", 1.0 )
            
        end
	elseif( iFrame >= pMonster:GetLastFrame() and pMonster:GetCountValue() <= 0) then
		pMonster:SetState( "ATTACK03A_END")
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK03ROLL")
    end

end
--대쉬 공격 03C상태
function Vanesa_Wolf_Attack03CFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if(iFrame == 3) then
        pMonster:SetFly(true)
		pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.0 )
        pMonster:SetSpeedY( -0.05 )
		pMonster:SetSuperArmorFrame(pMonster:GetLastFrame() + 5)
        pMonster:AddDamageWithAngle( DT_VANESSA_WOLF_ATK3, -0.75 )
		pMonster:PlaySound(247)
        if( pMonster:GetIsRight() == true ) then
        
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_03", 1.0 )
        else
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_R_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_R_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_R_03", 1.0 )
            
        end


	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK03ROLL")
	end
end
--대쉬 공격 03C_Ready상태
function Vanesa_Wolf_Attack03C_ReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 	if( iFrame == 3)   then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.0 )
        pMonster:SetSpeedY( -0.05 )
		pMonster:SetSuperArmorFrame(pMonster:GetLastFrame() + 5)
		pMonster:AddDamageWithAngle( DT_VANESSA_WOLF_ATK3, -0.75 )
		pMonster:PlaySound(247)
        if( pMonster:GetIsRight() == true ) then
        
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_03", 1.0 )
        else
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_R_01", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_R_02", 1.0 )
            pMonster:AddTraceParticleNoDirection( "Vanessa2_special3_Down_R_03", 1.0 )
            
        end

	elseif( iFrame >= pMonster:GetLastFrame() and pMonster:GetCountValue() <= 0) then
		pMonster:SetState( "ATTACK03A_END")
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK03ROLL")
    end
end
--대쉬 공격 03_end상태
function Vanesa_Wolf_Attack03_EndFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1) then
        	pMonster:SetFly(false)
			pMonster:SetSuperArmorFrame(pMonster:GetLastFrame() + 5)
        	pMonster:SetSpeedX( pMonster:GetWalkSpeed()*0.0 )
        	pMonster:SetSpeedY( pMonster:GetWalkSpeed()*0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
		if(pMonster:GetIsContact()==true) then
			pMonster:SetState( "WAIT")
		end
	end
end
--  점프 상태
function Vanesa_Wolf_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end


--  석화 상태
function Vanesa_Wolf_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
	elseif( iFrame == 150 ) then
		pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then        
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function Vanesa_Wolf_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )    
	elseif( iFrame == 150 ) then
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
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
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Middle", 0.0, 0.12 )
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

function Vanesa_Wolf_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget(  0, -1024, 800, 1024, -800 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Vanesa_Wolf_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Vanesa_Wolf_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -100, 200, 100, -200 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
    end
end


function Vanesa_Wolf_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Vanesa_Wolf_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end
function Vanesa_Wolf_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -200, 200, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end
function Vanesa_Wolf_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( pMonster:CheckTargetInRange( 200, -200, 300, 200, -300 ) == true ) then
        pMonster:SetCountValue(3)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end
--공격 중간에 체크
function Vanesa_Wolf_Check_Attack03_Start( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if(iFrame==30) then
        if( pMonster:CheckTargetInRange( 200, -200, 300, 200, 100 ) == true ) then
			pMonster:SetState( "ATTACK03A" )
			pMonster:ResetDelay()
    	elseif( pMonster:CheckTargetInRange( 200, -200, -100, 200, -300 ) == true ) then  --위에 있나 아래에 있나 체크
			pMonster:SetState( "ATTACK03C" )
			pMonster:ResetDelay()
    	else
			pMonster:SetState( "ATTACK03B" )
			pMonster:ResetDelay()
    	end
	end
end
--공격 중간에 체크
function Vanesa_Wolf_Check_Attack03_ROLL( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
    if(iFrame == 36) then
		if(pMonster:GetCountValue() > 0) then
      		pMonster:AddCountValue(-1)
	    	if( pMonster:CheckTargetInRange( -300, -300, 450, 300, 150  ) == true ) then
				print("뒤 위")
				pMonster:Turn()
				pMonster:SetState( "ATTACK03A_READY" )
           		pMonster:ResetDelay()
		    elseif( pMonster:CheckTargetInRange( -300, -300, -150, 300, -450 ) == true ) then  --위에 있나 아래에 있나 체크
                print("뒤 밑")
       			pMonster:Turn()
				pMonster:SetState( "ATTACK03C_READY" )
   				pMonster:ResetDelay()
		    elseif( pMonster:CheckTargetInRange( -300, -300, 150, 300, -150 ) == true ) then  --위에 있나 아래에 있나 체크
                print("뒤 중간")
    			pMonster:Turn()
				pMonster:SetState( "ATTACK03B_READY" )
    			pMonster:ResetDelay()
			elseif( pMonster:CheckTargetInRange( 300, -300, 450, 300, 150 ) == true ) then
                print("앞 위")
				pMonster:SetState( "ATTACK03A_READY" )
    			pMonster:ResetDelay()
		    elseif( pMonster:CheckTargetInRange( 300, -300, -150, 300, -450 ) == true ) then  --위에 있나 아래에 있나 체크
                print("앞 밑")
				print(pMonster:GetCountValue())
				pMonster:SetState( "ATTACK03C_READY" )
    			pMonster:ResetDelay()
		    elseif( pMonster:CheckTargetInRange( 300, -300, 150, 300, -150 ) == true ) then
		        print("죽어라 중간")
   			    pMonster:SetState( "ATTACK03B_READY" )
   				pMonster:ResetDelay()
   			else
   				print("때릴 아가 없다")
   				pMonster:SetCountValue(0)
				pMonster:SetState( "ATTACK03A_END" )
			end
    	end
   end	
end

function Vanesa_Wolf_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true ) then
		Vanesa_Wolf_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Vanesa_Wolf_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 60, -100, -40, 100, -600 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Vanesa_Wolf_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
	end	
    
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnVanesa_Wolf_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "ATTACK03A_END" ) == true ) then
	        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnVanesa_Wolf_Die( iMonsterIndex )
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

function OnVanesa_Wolf_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
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
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -4.0 )
			pMonster:SetNoCheckContact( 5 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	
	end
		
	if( pMonster:FloatRand() < 0.15 and pMonster:IsSuperArmor() == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if( pMonster:FloatRand() < 0.5 and pMonster:IsSuperArmor() == false ) then
			pMonster:TurnToTarget()
			pMonster:SetCountValue(0)
			pMonster:SetState( "ATTACK03" )	
	        pMonster:SetSuperArmor(true)		
		elseif( pMonster:GetIsContact() == true and pMonster:CheckTargetInRange( 0, -300, 300, 300, -300 ) == false ) then
			Vanesa_Wolf_Process_Jump( iMonsterIndex )
			pMonster:SetState( "JUMP" )
			pMonster:SetSuperArmor(true)
		end
	end
    
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end

function Vanesa_Wolf_Process_Jump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    --pMonster:SetPushCheck( false )

	pMonster:TurnToTarget()
	
	pMonster:SetNoCheckContact( 50 )

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

function Vanesa_Wolf_Jump( iMonsterIndex )
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

function Vanesa_Wolf_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(20)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.018)			
		end
	end
end
