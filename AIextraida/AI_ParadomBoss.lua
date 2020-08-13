-- AI_ParadomBoss.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Paradom_Wait.frm",
        Func    = "ParadomBoss_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "ParadomBoss_Check_Targeting",
                DelayFrame          = 110,
            },
            -- AT_Field
            {
                AICheckFrame        = 110,
                AIFunc              = "ParadomBoss_Check_AtField",
                DelayFrame          = 330,
            },
            -- 레이저공격02
            {
                AICheckFrame        = 55,
                AIFunc              = "ParadomBoss_Check_Attack02",
                DelayFrame          = 110,
            },
            -- 레이저공격03
            {
                AICheckFrame        = 75,
                AIFunc              = "ParadomBoss_Check_Attack03",
                DelayFrame          = 330,
            },
            -- 레이저공격05,06
            {
                AICheckFrame        = 100,
                AIFunc              = "ParadomBoss_Check_Attack05",
                DelayFrame          = 330,
            },
        },
    },
    
    -- 레이저공격02
    {
        ID      = "ATTACK02",
        Motion  = "Paradom_Attack02.frm",
        Func    = "ParadomBoss_Attack02Func",
    },
    
    -- 레이저공격03
    {
        ID      = "ATTACK03",
        Motion  = "Paradom_Attack03.frm",
        Func    = "ParadomBoss_Attack03Func",
    },
    
    -- 레이저공격05
    {
        ID      = "ATTACK05",
        Motion  = "Paradom_Attack05.frm",
        Func    = "ParadomBoss_Attack05Func",
    },
    
    -- 레이저공격06
    {
        ID      = "ATTACK06",
        Motion  = "Paradom_Attack05.frm",
        Func    = "ParadomBoss_Attack06Func",
    },
    
    -- AT_FIELD
    {
        ID      = "AT_FIELD",
        Motion  = "Paradom_Attack03.frm",
        Func    = "ParadomBoss_AtFieldFunc",
    },
		
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Paradom_Die.frm",
        Func    = "ParadomBoss_DieFunc",
    },
}

CallBack =
{
    Land    = "",
    Die     = "OnParadomBoss_Die",
    Damage  = "OnParadomBoss_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitParadomBoss( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetFly( true )
	pMonster:SetCountValue(0)
    pMonster:SetX( 0.35 )		
    pMonster:SetY( 0.7 )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function ParadomBoss_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetNoCheckContact(550)
		if( pMonster:GetCountValue() == 0 ) then
			pMonster:SetX( 0.35 )		
			pMonster:SetIsRight( true )	
		else
			pMonster:SetX( 2.15 )
			pMonster:SetIsRight( false )
		end
		
		pMonster:SetSpeedY( 0.0 )		
		pMonster:SetY( 0.7 )
        pMonster:SetState( "WAIT" )        
    end    
end

-- 죽는상태
function ParadomBoss_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 )then
		pMonster:PlaySound(102)
		pMonster:SetInvincible( true )
		pMonster:SetFly( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

--  레이저공격02 상태
function ParadomBoss_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 )then
		pMonster:SetNoCheckContact(550)    
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 31 )then
		pMonster:PlaySound(490)
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_LD_01", -0.2, 0.1 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_LD_02", -0.2, 0.1 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_LD_03", -0.2, 0.1 )	
		
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_LU_01", -0.2, 0.5 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_LU_02", -0.2, 0.5 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_LU_03", -0.2, 0.5 )	
		
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_RD_01", 0.2, 0.1 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_RD_02", 0.2, 0.1 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_RD_03", 0.2, 0.1 )	
		
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_RU_01", 0.2, 0.5 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_RU_02", 0.2, 0.5 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL3_RU_03", 0.2, 0.5 )	  
    elseif( iFrame >= 41 and iFrame < 81 )then    
		if( math.mod( iFrame, 10 ) == 0 ) then
			pMonster:AddDamageWithAngle( DT_MONSTER_PARADOM01_01, 0.785 )
			pMonster:AddDamageWithAngle( DT_MONSTER_PARADOM01_01, 2.340 )
			pMonster:AddDamageWithAngle( DT_MONSTER_PARADOM01_02, -0.740 )
			pMonster:AddDamageWithAngle( DT_MONSTER_PARADOM01_01, -2.340 )
		end
	elseif( iFrame == 141 )then 
		pMonster:PlaySound(490)   
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_D_01", 0.0, 0.0 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_D_02", 0.0, 0.0 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_D_03", 0.0, 0.0 )	
		
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_L_01", -0.3, 0.3 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_L_02", -0.3, 0.3 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_L_03", -0.3, 0.3 )	
		
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_U_01", 0.0, 0.59 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_U_02", 0.0, 0.59 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_U_03", 0.0, 0.59 )	
		
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_R_01", 0.3, 0.3 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_R_02", 0.3, 0.3 )	
		pMonster:AddParticleNoDirection( "Para_SPECIAL2_R_03", 0.3, 0.3 )	
	elseif( iFrame >= 151 and iFrame < 191 )then   
		if( math.mod( iFrame, 5 ) == 0 ) then
			pMonster:AddDamageWithAngle( DT_MONSTER_PARADOM01_03, 0.0 )
			pMonster:AddDamageWithAngle( DT_MONSTER_PARADOM01_01, 1.570 )
			pMonster:AddDamageWithAngle( DT_MONSTER_PARADOM01_03, 3.140 )
			pMonster:AddDamageWithAngle( DT_MONSTER_PARADOM01_03, -1.570 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetY( 0.7 )
        pMonster:SetState( "WAIT" )        
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetFly( false )
			pMonster:SetState( "DIE" )
		end
    end
end

--  레이저공격03 상태
function ParadomBoss_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame < 41 ) then
		if( iFrame <= 1 )then    
			pMonster:SetNoCheckContact(550)
			pMonster:SetSuperArmor( true )
		end
		
		pMonster:SetSpeedY( 0.015 )
	elseif( iFrame == 41 ) then
		pMonster:PlaySound(336)
		pMonster:SetSpeedY( 0.0 )
		pMonster:AddTraceParticle( "Para_SPECIAL1_down01", 1.7 )			
		pMonster:AddTraceParticle( "Para_SPECIAL1_down02", 1.7 )			
		pMonster:AddTraceParticle( "Para_SPECIAL1_down03", 1.4 )			
	elseif( iFrame >= 61 and iFrame < 161 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.9 )
		
		if( iFrame > 61 and iFrame < 141 ) then
			if( math.mod( iFrame, 4) == 0 ) then
				pMonster:AddDamage( DT_MONSTER_PARADOM02 )			
			end
		end
	elseif( iFrame == 161 ) then
		pMonster:SetSpeedX( 0.0 )
		
		if( pMonster:GetCountValue() == 0 ) then
			pMonster:SetX( 0.35 )		
			pMonster:SetIsRight( true )
		else
			pMonster:SetX( 2.15 )		
			pMonster:SetIsRight( false )
		end
		
	elseif( iFrame >= 161 and iFrame < 201) then
		pMonster:SetSpeedY( -0.015 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetY( 0.7 )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetFly( false )
			pMonster:SetState( "DIE" )
		end
    end
end

--  레이저공격05 상태
function ParadomBoss_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame < 41 ) then
		if( iFrame <= 1 )then    
			pMonster:SetNoCheckContact(550)
			pMonster:SetSuperArmor( true )
			pMonster:StartText( "DANGER" )
			pMonster:PlaySound( "129" )
		end
		
		pMonster:SetSpeedY( -0.01 )
	elseif( iFrame == 41 ) then
		pMonster:SetSpeedY( 0.0 )
		pMonster:PlaySound(336)
	elseif( iFrame == 51 ) then
		if( pMonster:GetIsRight() )then
			pMonster:AddParticle( "Para_SPECIAL1_01", 0.35, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_02", 0.35, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_03", 0.35, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_04", 0.35, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_05", 0.4, 0.3 )	
		else
			pMonster:AddParticle( "Para_SPECIAL1_01", 0.45, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_02", 0.65, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_03", 0.45, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_04", 0.35, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_05", 0.35, 0.3 )	
		end
		        		
	--elseif( iFrame >= 61 and iFrame < 176 ) then
	elseif( iFrame >= 81 and iFrame < 156 ) then
		if( math.mod( iFrame, 6) == 0 ) then
			pMonster:AddDamage( DT_MONSTER_PARADOM03 )
		end
	elseif( iFrame >= 196 and   iFrame < pMonster:GetLastFrame() ) then
		pMonster:SetSpeedY( 0.01 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetY( 0.7 )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetFly( false )
			pMonster:SetState( "DIE" )
		end
    end
end

--  레이저공격06 상태
function ParadomBoss_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame < 41 ) then
		if( iFrame <= 1 )then    
			pMonster:SetNoCheckContact(550)
			pMonster:SetSuperArmor( true )
			pMonster:StartText( "DANGER" )
			pMonster:PlaySound( "129" )
		end
		
		pMonster:SetSpeedY( 0.008 )
	elseif( iFrame == 41 ) then
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame == 51 ) then
		pMonster:PlaySound(336)
		if( pMonster:GetIsRight() )then
			pMonster:AddParticle( "Para_SPECIAL1_01", 0.35, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_02", 0.35, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_03", 0.35, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_04", 0.35, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_05", 0.4, 0.3 )	
		else
			pMonster:AddParticle( "Para_SPECIAL1_01", 0.45, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_02", 0.65, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_03", 0.45, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_04", 0.35, 0.3 )			
			pMonster:AddParticle( "Para_SPECIAL1_05", 0.35, 0.3 )	
		end
		
	--elseif( iFrame >= 61 and iFrame < 176 ) then
	elseif( iFrame >= 81 and iFrame < 156 ) then
		if( math.mod( iFrame, 6 ) == 0 ) then
			pMonster:AddDamage( DT_MONSTER_PARADOM03 )
		end
	elseif( iFrame >= 196 and   iFrame < pMonster:GetLastFrame() ) then
		pMonster:SetSpeedY( -0.008 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetY( 0.7 )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetFly( false )
			pMonster:SetState( "DIE" )
		end
    end
end

--  AT Field 상태
function ParadomBoss_AtFieldFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 31 ) then
		pMonster:PlaySound(500)
		pMonster:AddDamage( DT_MONSTER_PARADOM_ATFIELD )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetY( 0.7 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function ParadomBoss_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function ParadomBoss_Check_AtField( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "AT_FIELD" )
		pMonster:ResetDelay()
    end
end

function ParadomBoss_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function ParadomBoss_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    
    if( pMonster:IsTarget() == true ) then
		if( pMonster:GetCountValue() == 0 ) then
			pMonster:SetCountValue(1)
		else
			pMonster:SetCountValue(0)
		end
		
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function ParadomBoss_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 600, -600, 0, 600, -500 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	elseif( pMonster:CheckTargetInRange( 600, -600, 300, 600, 100 ) == true ) then
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------

function OnParadomBoss_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "ATTACK05" ) == false and pMonster:CheckState( "ATTACK06" ) == false ) then
		pMonster:SetFly( false )
		pMonster:SetState( "DIE" )	
	end
end

function OnParadomBoss_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
    pMonster:SetSpeedY( 0.0 )
    
    if( pMonster:GetCountValue() == 0 ) then
		pMonster:SetIsRight( true )	
	else
		pMonster:SetIsRight( false )
	end
end
