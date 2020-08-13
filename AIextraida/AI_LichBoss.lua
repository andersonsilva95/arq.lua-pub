-- AI_LichBoss.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Lich_Wait.frm",
        Func    = "LichBoss_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "LichBoss_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "LichBoss_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "LichBoss_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "LichBoss_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ����Ʈ�� ����
            {
                AICheckFrame        = 150,
                AIFunc              = "LichBoss_Check_Attack02",
                DelayFrame          = 110,
            },
            -- �ӹڰ���
            {
                AICheckFrame        = 100,
                AIFunc              = "LichBoss_Check_Attack03",
                DelayFrame          = 400,
            },
            -- �ذ��ȯ
            {
                AICheckFrame        = 220,
                AIFunc              = "LichBoss_Check_Attack04",
                DelayFrame          = 2200,
            },
            -- �ȱ�
            {
                AICheckFrame        = 75,
                AIFunc              = "LichBoss_Check_Walk",
                DelayFrame          = 150,
            },            
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "LichBoss_Check_HighJump",
                DelayFrame          = 55,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "LichBoss_Check_JumpDown",
                DelayFrame          = 55,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Lich_Walk.frm",
        Func    = "LichBoss_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "LichBoss_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "LichBoss_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "LichBoss_Check_TurnToTarget",
                DelayFrame          = 55,
            },       
            -- ��������
            {
                AICheckFrame        = 45,
                AIFunc              = "LichBoss_Check_Attack01",
                DelayFrame          = 110,
            },            
            -- ����Ʈ�� ����
            {
                AICheckFrame        = 150,
                AIFunc              = "Lich_Check_Attack02",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "LichBoss_Check_HighJump",
                DelayFrame          = 75,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "LichBoss_Check_JumpDown",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Lich_Attack01.frm",
        Func    = "LichBoss_Attack01Func",
    },
    
    -- ����Ʈ�� ����
    {
        ID      = "ATTACK02",
        Motion  = "Lich_Attack02.frm",
        Func    = "LichBoss_Attack02Func",
    },
    
    -- �ӹ�
    {
        ID      = "ATTACK03",
        Motion  = "Lich_Attack03.frm",
        Func    = "LichBoss_Attack03Func",
    },
    
    -- �ذ��ȯ
    {
        ID      = "ATTACK04",
        Motion  = "Lich_Attack04.frm",
        Func    = "LichBoss_Attack04Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Lich_Jump.frm",
        Func    = "LichBoss_JumpFunc",
    },
    
    -- ���� ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Lich_Jump_Landing.frm",
        Func    = "LichBoss_JumpLandingFunc",
    },
    

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Lich_Damage_Up.frm",
        Func    = "LichBoss_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Lich_Damage_Middle.frm",
        Func    = "LichBoss_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Lich_Damage_Down.frm",
        Func    = "LichBoss_DamageFunc",
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_UP",
        Motion  = "Lich_Down_Up.frm",
        Func    = "LichBoss_DownUpFunc",
    },
    
    -- �ٿ� ����� 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Lich_Down_Special.frm",
        Func    = "LichBoss_DownUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Lich_Die.frm",
        Func    = "LichBoss_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    --[[
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Lich_Stone.frm",
        Func    = "LichBoss_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Lich_Stone.frm",
        Func    = "LichBoss_IceCurseFunc",
    },
    --]]
}

CallBack =
{
    Land    = "OnLichBoss_Land",
    Die     = "OnLichBoss_Die",
    Damage  = "OnLichBoss_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitLichBoss( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    --pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    --pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    
    pMonster:RegisterSummonMonsterType( MON_ZOMBIEKNIGHTORC )

end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function LichBoss_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

function LichBoss_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end


-- �ȱ� ����
function LichBoss_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

--  ��������01 ����
function LichBoss_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 55 ) then
		pMonster:AddDamage( DT_MONSTER_LICH01 )
		pMonster:PlaySound(343)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ʈ�� ����
function LichBoss_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then	
		pMonster:SetSuperArmor( true )	    
	elseif( iFrame == 54 ) then
		pMonster:PlaySound(41)
	elseif( iFrame >= 55 and iFrame < 91 ) then		
		if( math.mod( iFrame, 2 ) == 0 ) then
			pMonster:AddDamageWithLocate( DT_LIGHTNING_GENERATE1, 0.5, 0.05 )
			pMonster:AddDamageWithLocate( DT_LIGHTNING_BOLT, 0.45, 0.05 )
			pMonster:AddDamageWithLocate( DT_LIGHTNING_BOLT, 1.45, 0.05 )
			pMonster:AddDamageWithLocate( DT_LIGHTNING_BOLT, 2.45, 0.05 )
		end		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �ӹڰ��� ����
function LichBoss_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
		pMonster:StartText("JUMP")
	    pMonster:SkillReadyEffectNoStop( 80, 60, 100, 0.0 )
	elseif( iFrame >= 55 and iFrame <= 65 ) then
	    if( iFrame == 56 ) then
			pMonster:PlaySound(351)
		end
	    if( iFrame == 55 ) then
	        pMonster:FreezeAttack( -0.01, true )
	    else
	        pMonster:FreezeAttack( -0.01, false )
	    end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �ذ��ȯ ����
function LichBoss_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
	    pMonster:SkillReadyEffectNoStop( 80, 60, 100, 0.0 )
    elseif( iFrame == 46 ) then
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_ZOMBIEKNIGHTORC
        pMon.fX = 200
        pMon.fY = 0
        pMonster:SummonMonster( pMon )

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���Ա� ����
function LichBoss_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �׶��� �극��ũ ����
function LichBoss_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 81 ) then
        pMonster:AddDamage( DT_MONSTER_LichBoss02 )
    elseif( iFrame == 89 ) then
		pMonster:EarthQuake( 25, 0.06, 0.0 )		
	elseif( iFrame == 91 ) then
		pMonster:PlaySound( "47" )
		pMonster:AddDamageWithLocate( DT_MONSTER_LichBoss_SPECIAL01, 0.8, 0.0 )
		pMonster:AddParticle( "Broken_Ground02", 0.8, 0.1 )		
		pMonster:AddParticle( "Broken_Ground03", 0.8, 0.1 )		
		pMonster:AddParticle( "Broken_Ground04", 0.8, 0.1 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���� ����
function LichBoss_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �������� ����
function LichBoss_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �״»���
function LichBoss_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function LichBoss_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ�
function LichBoss_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function LichBoss_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE" )
        end  
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function LichBoss_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function LichBoss_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function LichBoss_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function LichBoss_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 250, -250, 600, 250, 150 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		LichBoss_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function LichBoss_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 260, -300, -80, 300, -1000 ) == true ) then
        pMonster:SetNoCheckContact(25)
        pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function LichBoss_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 100, 100, -50 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function LichBoss_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 500, -200, 100, 200, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
    end
end

function LichBoss_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -200, 400, 200, -300 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function LichBoss_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetSummonedMonsterCount() < 1 ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function LichBoss_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnLichBoss_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "JUMP" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP" ) == true ) then
		pMonster:SetPushCheck( true )
        --pMonster:SetState( "WAIT" )
    end    
end

function OnLichBoss_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end	
end

function OnLichBoss_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( true )		
	
	if( pMonster:CheckState( "DOWN_UP" ) == true or pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
		pMonster:SetNoCheckContact(10)
		pMonster:SetSpeedY( 0.020 )
	else
		pMonster:SetSpeedX( 2.0 * pMonster:GetSpeedX() / 3.0 )
		pMonster:SetSpeedY( 2.0 * pMonster:GetSpeedY() / 3.0 )
	end
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )		
	end
	
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.028 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" ) ) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.019 )			
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.0 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_UP02" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )			
		end	
	end
	
end

function LichBoss_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function LichBoss_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(40)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.042 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.0120)			
		end
	end
end
